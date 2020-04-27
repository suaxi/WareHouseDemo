package com.sw.warehouse.aspect;

import com.sw.warehouse.annotation.SysControllerLog;
import com.sw.warehouse.annotation.SysServiceLog;
import com.sw.warehouse.dao.SyslogDao;
import com.sw.warehouse.entity.Syslog;
import com.sw.warehouse.entity.Userinfo;
import com.sw.warehouse.util.IpUtils;
import com.sw.warehouse.util.JsonUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;

@Aspect
@Component
@SuppressWarnings("all")
public class SysLogAspecet {
    //注入Entity实体类，用于把日志保存到数据库
    @Resource
    private SyslogDao syslogDao;
    //本地异常日志记录对象
    private static final Logger logger= LoggerFactory.getLogger(SysLogAspecet.class);
    //Service层切点
    @Pointcut("@annotation(com.sw.warehouse.annotation.SysServiceLog)")
    public void serviceAspect(){

    }
    //Controller层切点
    @Pointcut("@annotation(com.sw.warehouse.annotation.SysControllerLog)")
    public void controllerAspect(){

    }

    /**
     * @Description  前置通知  用于拦截Controller层记录用户的操作
     * @param joinPoint
     */
    @Before("controllerAspect()")
    public void doBefore(JoinPoint joinPoint){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        //读取session中的用户
        Userinfo user = (Userinfo) session.getAttribute("user");
        String ip = IpUtils.getIpAddr(request);
        if (user!=null){
            try {
                //控制台输出
                System.out.println("====前置通知开始====");
                System.out.println("请求者："+user.getUsername());
                System.out.println("请求方法:"+(joinPoint.getTarget()).getClass().getName()+"."+joinPoint.getSignature().getName());
                System.out.println("方法描述:"+getControllerMethodDescription(joinPoint));
                System.out.println("请求IP："+ip);
                Date date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                System.out.println("操作时间："+sdf.format(date));

                //数据库日志
                Syslog s = new Syslog();
                s.setUsername((String) user.getUsername());
                s.setOperation((joinPoint.getTarget()).getClass().getName()+"."+joinPoint.getSignature().getName());
                s.setMethod(getControllerMethodDescription(joinPoint));
                s.setIp(ip);
                s.setCreatetime(new Date());
                //保存到数据库
                syslogDao.save(s);
            }catch (Exception e){
                //记录本地异常日志
                logger.error("==前置通知异常==");
                logger.error("异常信息：{}",e.getMessage());
            }
        }

    }

    @AfterThrowing(pointcut = "serviceAspect()",throwing = "e")
    public void doAfterThrowing(JoinPoint joinPoint,Throwable e){
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        //读取session中的用户
        Userinfo user = (Userinfo) session.getAttribute("user");
        //获取请求ip
        String ip = IpUtils.getIpAddr(request);
        //获取用户请求方法的参数并序列化为JSON格式字符串
        String params = "";
        if (joinPoint.getArgs()!=null&&joinPoint.getArgs().length>0){
            for (int i=0;i<joinPoint.getArgs().length;i++){
                params+= JsonUtils.objectToJson(joinPoint.getArgs()[i])+";";
            }
        }
        try {
           //控制台输出
            System.out.println("====异常通知开始====");
            System.out.println("异常代码："+e.getClass().getName());
            System.out.println("异常信息："+e.getMessage());
            System.out.println("请求者："+(String) user.getUsername());
            System.out.println("异常方法："+(joinPoint.getTarget().getClass().getName()+"."+joinPoint.getSignature().getName()+"()"));
            System.out.println("方法描述："+getServiceMethodDescription(joinPoint));
            System.out.println("请求参数："+params);
            System.out.println("请求IP："+ip);
            //数据库日志
            Syslog s = new Syslog();
            s.setUsername((String) user.getUsername());
            s.setOperation((joinPoint.getTarget().getClass().getName()+"."+joinPoint.getSignature().getName()+"()"));
            s.setMethod(getServiceMethodDescription(joinPoint));
            s.setParams(params);
            s.setIp(ip);
            s.setCreatetime(new Date());
            //保存到数据库
            syslogDao.save(s);
        }catch (Exception ex){
            //记录本地异常日志
            logger.error("==异常通知异常==");
            logger.error("异常信息：{}",ex.getMessage());
        }

    }

    //获取注解中对方法的描述信息 用于service层
    public static String getServiceMethodDescription(JoinPoint joinPoint) throws ClassNotFoundException {
        String targetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(targetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)){
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length==arguments.length){
                    description=method.getAnnotation(SysServiceLog.class).description();
                    break;
                }
            }
        }
        return description;
    }

    //获取注解中对方法的描述信息 用于controller层
    public static String getControllerMethodDescription(JoinPoint joinPoint) throws ClassNotFoundException {
        String tergetName = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();//目标方法名
        Object[] arguments = joinPoint.getArgs();
        Class targetClass = Class.forName(tergetName);
        Method[] methods = targetClass.getMethods();
        String description = "";
        for (Method method : methods) {
            if (method.getName().equals(methodName)){
                Class[] clazzs = method.getParameterTypes();
                if (clazzs.length==arguments.length){
                    description = method.getAnnotation(SysControllerLog.class).description();
                    break;
                }
            }
        }
        return description;
    }
}
