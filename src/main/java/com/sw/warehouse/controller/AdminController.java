package com.sw.warehouse.controller;

import com.sw.warehouse.annotation.SysControllerLog;
import com.sw.warehouse.dao.*;
import com.sw.warehouse.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller //处理网络请求
public class AdminController {

    //删除出/入库信息
    @RequestMapping("/deleteProduct")
    @SysControllerLog(description = "删除出/入库信息")
    public String deleteProduct(Integer id){
        productinfoDao.deleteById(id);
        return "redirect:productList";
    }

//    //出库
//    @RequestMapping("/productSave1")
//    @SysControllerLog(description = "出库--管理员")
//    public String productSave1(Productinfo p, HttpServletRequest req){
//        //出库的同时更新库存
//        productinfoDao.save(p);
//        String productname=req.getParameter("productname");
//        String name=req.getParameter("productname");
//        stockinfoDao.reduceStock(productname,name);
//        //完成操作后设置工单状态为已完成
//        String id = req.getParameter("id");
//        requestinfoDao.checkstatus(Integer.parseInt(id));
//        return "redirect:productList";
//    }
//    @RequestMapping("/outbound")
//    public String uoutbound(Integer id,Model m){
//        Requestinfo out = requestinfoDao.getOne(id);
//        m.addAttribute("out",out);
//        return "outbound";
//    }
//    //入库
//    @RequestMapping("/productSave")
//    @SysControllerLog(description = "入库--管理员")
//    public String productSave(Productinfo p, HttpServletRequest req){
//        //入库的同时更新库存
//        productinfoDao.save(p);
//        String productname=req.getParameter("productname");
//        String name=req.getParameter("productname");
//        stockinfoDao.increaseStock(productname,name);
//        //完成操作后设置工单状态为已完成
//        String id = req.getParameter("id");
//        requestinfoDao.checkstatus(Integer.parseInt(id));
//        return "redirect:productList";
//    }
//    @RequestMapping("/inbound")
//    public String uinbound(Integer id,Model m){
//        Requestinfo in = requestinfoDao.getOne(id);
//        m.addAttribute("in",in);
//        return "inbound";
//    }

    //查询反馈信息
    @Autowired
    Messageinfodao messageinfodao;
    @RequestMapping("/msgList")
    @SysControllerLog(description = "查询信息反馈详情")
    public String msgList(Model m){
        List<Messageinfo> msg = messageinfodao.findAll();
        m.addAttribute("msg",msg);
        return "msgList";
    }

    @Autowired
    StockinfoDao stockinfoDao;
    //添加库存
    //查询供应商、仓库信息
    @RequestMapping("/stockAdd")
    @SysControllerLog(description = "添加库存时查询供应商和仓库信息")
    public String querySupplier(Model m){
        List<Supplierinfo> qsName = supplierinfoDao.findAll();
        m.addAttribute("qsName",qsName);
        List<Warehouseinfo> qwName = warehouseinfoDao.findAll();
        m.addAttribute("qwName",qwName);
        return "stockAdd";
    }
    //管理员修改库存
    @RequestMapping("/stockUpdate")
    @SysControllerLog(description = "修改后的库存信息保存到数据库")
    public String stockUpdate(Stockinfo s){
        stockinfoDao.save(s);
        return "redirect:stockList";
    }
    @RequestMapping("/stockEdit")
    @SysControllerLog(description = "修改库存信息")
    public String stockEdit(Integer id,Model m){
        Stockinfo stEdit = stockinfoDao.getOne(id);
        m.addAttribute("stEdit",stEdit);
        return "stockEdit";
    }
    //查询库存
    @RequestMapping("/stockList")
    @SysControllerLog(description = "管理员查询库存")
    public String queryStock(Model m){
        List<Stockinfo> qStock = stockinfoDao.findAll();
        m.addAttribute("qStock",qStock);
        return "stockList";
    }

    //管理员查询系统操作日志
    @Autowired
    SyslogDao syslogDao;
    @RequestMapping("/logList")
    @SysControllerLog(description = "查询操作日志")
    public String logList(Model m){
        List<Syslog> logs = syslogDao.findAll();
        m.addAttribute("logs",logs);
        return "logList";
    }

    @Autowired
    RequestinfoDao requestinfoDao;
    //管理员处理需求单信息
    @RequestMapping("/requestUpdte")
    @SysControllerLog(description = "处理后的需求单信息保存到数据库")
    public String requestUpdte(Requestinfo r){
        requestinfoDao.save(r);
        return "redirect:requestList";
    }
    @RequestMapping("/requestDeal")
    //AOP拦截Controller
    @SysControllerLog(description = "处理需求单")
    public String requestDeal(Integer id,Model m){
        Requestinfo rDeal = requestinfoDao.getOne(id);
        m.addAttribute("rDeal",rDeal);
        return "requestDeal";
    }

    //管理员查询需求单信息
    @RequestMapping("/requestList")
    @SysControllerLog(description = "查询需求单")
    public String requestList(Model m){
        List<Requestinfo> request = requestinfoDao.findAll();
        m.addAttribute("request",request);
        return "requestList";
    }

    //管理员查询产品存储信息
    @Autowired
    ProductinfoDao productinfoDao;
    @RequestMapping("/productList")
    @SysControllerLog(description = "查询产品存储信息")
    public String productList(Model m){
        List<Productinfo> product = productinfoDao.findAll();
        m.addAttribute("product",product);
        return "productList";
    }

    @Autowired
    SupplierinfoDao supplierinfoDao;
    //管理员修改供应商信息
    @RequestMapping("/supplierUpdate")
    @SysControllerLog(description = "修改后的供应商信息保存到数据库")
    public String supplierUpdate(Supplierinfo s){
        supplierinfoDao.save(s);
        return "redirect:supplierList";
    }
    @RequestMapping("/supplierEdit")
    @SysControllerLog(description = "修改供应商信息")
    public String supplierEdit(Integer id,Model m){
        Supplierinfo sEdit = supplierinfoDao.getOne(id);
        m.addAttribute("sEdit",sEdit);
        return "supplierEdit";
    }

    //管理员删除供应商
    @RequestMapping("/supplierDelete")
    @SysControllerLog(description = "删除供应商")
    public String supplierDelete(Integer id){
        supplierinfoDao.deleteById(id);
        return "redirect:supplierList";
    }

    //管理员添加供应商
    @RequestMapping("/supplierSave")
    @SysControllerLog(description = "添加供应商")
    public String supplierSave(Supplierinfo s){
        supplierinfoDao.save(s);
        return "redirect:supplierList";
    }

    //管理员查询供应商信息
    @RequestMapping("/supplierList")
    @SysControllerLog(description = "查询供应商信息")
    public String supplierList(Model m){
        List<Supplierinfo> supplier = supplierinfoDao.findAll();
        m.addAttribute("supplier",supplier);
        return "supplierList";
    }

    @Autowired
    WarehouseinfoDao warehouseinfoDao;
    //管理员删除仓库信息
    @RequestMapping("/wareHouseDelete")
    @SysControllerLog(description = "删除仓库")
    public String wareHouseDelete(Integer id){
        warehouseinfoDao.deleteById(id);
        return "redirect:wareHouseList";
    }

    //管理员修改仓库信息
    @RequestMapping("/wareHouseUpdate")
    @SysControllerLog(description = "修改后的仓库信息保存到数据库")
    public String wareHouseUpdate(Warehouseinfo w1){
        warehouseinfoDao.save(w1);
        return "redirect:wareHouseList";
    }
    @RequestMapping("/wareHouseEdit")
    @SysControllerLog(description = "修改仓库信息")
    public String wareHouseEdit(Integer id,Model m){
        Warehouseinfo whEdit = warehouseinfoDao.getOne(id);
        m.addAttribute("whEdit",whEdit);
        return "wareHouseEdit";
    }

    //管理员添加仓库信息
    @RequestMapping("/wareHouseSave")
    @SysControllerLog(description = "添加仓库信息")
    public String wareHouseSave(Warehouseinfo w){
        warehouseinfoDao.save(w);
        warehouseinfoDao.savepicurl();
        return "redirect:wareHouseList";
    }

    //管理员查询仓库信息
    @RequestMapping("/wareHouseList")
    @SysControllerLog(description = "查询仓库信息")
    public String wareHouseList(Model m){
        List<Warehouseinfo> wareHouse = warehouseinfoDao.findAll();
        m.addAttribute("wareHouse",wareHouse);
        return "wareHouseList";
    }

    @Autowired
    UserinfoDao userinfoDao;
    //管理员修改员工信息
    @RequestMapping("/userUpdate")
    @SysControllerLog(description = "修改员工信息保存到数据库")
    public String userUpdate(Userinfo u){
        userinfoDao.save(u);
        return "redirect:userList";
    }
    @RequestMapping("/userEdit")
    @SysControllerLog(description = "修改员工信息")
    public String userEdit(Integer id,Model m){
        Userinfo uEdit = userinfoDao.getOne(id);
        m.addAttribute("uEdit",uEdit);
        return "userEdit";
    }

    //管理员删除员工
    @RequestMapping("/userDelete")
    @SysControllerLog(description = "删除员工信息")
    public String userDelete(Integer id){
        userinfoDao.deleteById(id);
        return "redirect:userList";
    }

    //管理员添加员工信息
    @RequestMapping("/userSave")
    @SysControllerLog(description = "添加员工信息")
    public String userSave(Userinfo u){
        userinfoDao.save(u);
        userinfoDao.savepicurl();
        return "redirect:userList";
    }

    //管理员查询员工信息
    @RequestMapping("/userList")
    @SysControllerLog(description = "查询员工信息")
    public String userList(Model m){
        List<Userinfo> users = userinfoDao.findAll();
        m.addAttribute("users",users);
        return "userList";
    }

    @RequestMapping("adminIndex")
    public String adminIndex(Model m){
        int count=requestinfoDao.checkRequest();
        m.addAttribute("count",count);
        return "adminIndex";
    }
}
