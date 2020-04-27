package com.sw.warehouse.controller;

import com.sw.warehouse.annotation.SysControllerLog;
import com.sw.warehouse.dao.RequestinfoDao;
import com.sw.warehouse.dao.UserinfoDao;
import com.sw.warehouse.entity.Userinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class LoginController {

    //退出
    @RequestMapping("/quit")
    @SysControllerLog(description = "退出登录")
    public String quit(){
        return "login";
    }

    //登录
    @Autowired
    UserinfoDao userinfoDao;
    @Autowired
    RequestinfoDao requestinfoDao;
    @RequestMapping("/doLogin")
    @SysControllerLog(description = "登录")
    public String login(Model m, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        List<Userinfo> all = userinfoDao.findAll();
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        m.addAttribute("all",all);
        for (int i=0;i<all.size();i++){
            if (all.get(i).getUsername().equals(username)&&all.get(i).getPassword().equals(password)){
                req.getSession().setAttribute("user",all.get(i));
                if (all.get(i).getRole().equals("1")){
                    //检查工单是否处理，作提醒消息
                    int count=requestinfoDao.checkRequest();
                    m.addAttribute("count",count);
                    return "adminIndex";
                }else {
                    return "userIndex";
                }
            }else {
                resp.getWriter().write(String.valueOf(1));
            }
        }
        return "login";
    }

    //localhost:8088/
    @RequestMapping("/")
    public String login(){
        return "login";
    }
}
