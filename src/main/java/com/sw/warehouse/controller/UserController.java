package com.sw.warehouse.controller;

import com.sw.warehouse.annotation.SysControllerLog;
import com.sw.warehouse.dao.*;
import com.sw.warehouse.entity.*;
import com.sw.warehouse.service.StockinfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
public class UserController {

    @Autowired
    Messageinfodao messageinfodao;
    @RequestMapping("/msgSave")
    @SysControllerLog(description = "提交信息反馈")
    public String msgSave(Messageinfo m){
        messageinfodao.save(m);
        return "redirect:userIndex";
    }

    @Autowired
    StockinfoDao stockinfoDao;
    //用户提交工单查询商品、仓库、供应商信息
    @RequestMapping("/urequestAdd")
    @SysControllerLog(description = "提交工单查询商品、仓库、供应商信息--用户")
    public String urAddcheck(Model m, HttpServletRequest req, HttpServletResponse resp) throws IOException {
        //填写工单时查询供应商、仓库名信息绑定到option标签
        List<Supplierinfo> qsName = supplierinfoDao.findAll();
        m.addAttribute("qsName",qsName);
        List<Warehouseinfo> qwName = warehouseinfoDao.findAll();
        m.addAttribute("qwName",qwName);
        List<Stockinfo> qstockName = stockinfoDao.findAll();
        m.addAttribute("qstockName",qstockName);
        return "urequestAdd";
    }

    //查询对应商品的库存数量
    @Autowired
    StockinfoService stockinfoService;
    @RequestMapping("/checkStock")
    public String checkStock(HttpServletRequest req,HttpServletResponse resp) throws IOException {
        //获取用户输入的商品名称
        String name=req.getParameter("productname");
        int result = stockinfoService.queryStock(name);
        resp.getWriter().write(result);
        System.out.println(name+result);
        return "urequestAdd";
    }

    //查询库存
    @RequestMapping("/ustockList")
    @SysControllerLog(description = "用户查询库存")
    public String uqueryStock(Model m){
        List<Stockinfo> uqStock = stockinfoDao.findAll();
        m.addAttribute("uqStock",uqStock);
        return "ustockList";
    }

    @Autowired
    RequestinfoDao requestinfoDao;
    //员工提交需求单信息
    @RequestMapping("/urequestSave")
    @SysControllerLog(description = "提交工单")
    public String urequestSave(Requestinfo r){
        requestinfoDao.save(r);
        return "redirect:urequestList";
    }

    //员工查询需求单信息
    @RequestMapping("/urequestList")
    @SysControllerLog(description = "查询工单")
    public String urequest(Model m){
        List<Requestinfo> urequest = requestinfoDao.findAll();
        m.addAttribute("urequest",urequest);
        return "urequestList";
    }

    @Autowired
    ProductinfoDao productinfoDao;
    //出库
    @RequestMapping("/uproductSave1")
    @SysControllerLog(description = "出库")
    public String uproductSave1(Productinfo p, HttpServletRequest req){
        //出库的同时更新库存
        productinfoDao.save(p);
        String name=req.getParameter("productname");
        String productname=req.getParameter("productname");
        String productname1=req.getParameter("productname");
        stockinfoDao.reduceStock(name,productname,productname1);
        //完成操作后设置工单状态为已完成
        String id = req.getParameter("id");
        requestinfoDao.checkstatus(Integer.parseInt(id));
        return "redirect:uproductList";
    }
    @RequestMapping("/uoutbound")
    public String uoutbound(Integer id,Model m){
        Requestinfo uout = requestinfoDao.getOne(id);
        m.addAttribute("uout",uout);
        return "uoutbound";
    }
    //入库
    @RequestMapping("/uproductSave")
    @SysControllerLog(description = "入库")
    public String uproductSave(Productinfo p, HttpServletRequest req){
        //入库的同时更新库存
        productinfoDao.save(p);
        String name=req.getParameter("productname");
        String productname=req.getParameter("productname");
        String productname1=req.getParameter("productname");
        stockinfoDao.increaseStock(name,productname,productname1);
        //完成操作后设置工单状态为已完成
        String id = req.getParameter("id");
        requestinfoDao.checkstatus(Integer.parseInt(id));
        return "redirect:uproductList";
    }
    @RequestMapping("/uinbound")
    public String uinbound(Integer id,Model m){
        Requestinfo uin = requestinfoDao.getOne(id);
        m.addAttribute("uin",uin);
        return "uinbound";
    }

    //审核不通过重新提交工单
    @RequestMapping("/urecheckSave")
    public String urecheckSave(Requestinfo r){
        requestinfoDao.save(r);
        return "redirect:urequestList";
    }
    @RequestMapping("/urecheckRequest")
    @SysControllerLog(description = "重新提交工单")
    public String recheck(Integer id,Model m){
        Requestinfo urec = requestinfoDao.getOne(id);
        m.addAttribute("urec",urec);
        return "urecheckRequest";
    }

    //员工查询产品存储信息
    @RequestMapping("/uproductList")
    @SysControllerLog(description = "查询产品存储信息")
    public String uproductList(Model m){
        List<Productinfo> uproduct = productinfoDao.findAll();
        m.addAttribute("uproduct",uproduct);
        return "uproductList";
    }


    @Autowired
    SupplierinfoDao supplierinfoDao;
    //员工查询供应商信息
    @RequestMapping("/usupplierList")
    @SysControllerLog(description = "查询供应商信息")
    public String usupplierList(Model m){
        List<Supplierinfo> usupplier = supplierinfoDao.findAll();
        m.addAttribute("usupplier",usupplier);
        return "usupplierList";
    }

    @Autowired
    WarehouseinfoDao warehouseinfoDao;
    //员工查询仓库信息
    @RequestMapping("/uwareHouseList")
    @SysControllerLog(description = "查询仓库信息")
    public String uwareHouseList(Model m){
        List<Warehouseinfo> uwareHouse = warehouseinfoDao.findAll();
        m.addAttribute("uwareHouse",uwareHouse);
        return "uwareHouseList";
    }

    @Autowired
    UserinfoDao userinfoDao;
    //修改个人信息
    @RequestMapping("/uuserUpdate")
    @SysControllerLog(description = "用户修改个人信息")
    public String uuserUpdate(Userinfo u){
        userinfoDao.save(u);
        return "redirect:uuserList";
    }
    @RequestMapping("/uuserEdit")
    public String uuserEdit(Integer id,Model m){
        Userinfo uuEdit = userinfoDao.getOne(id);
        m.addAttribute("uuEdit",uuEdit);
        return "uuserEdit";
    }

    //查询用户信息--员工
    @RequestMapping("/uuserList")
    @SysControllerLog(description = "查询用户信息--员工")
    public String userinfo(Model m){
        List<Userinfo> uuserinfo = userinfoDao.findAll();
        m.addAttribute("uuserinfo",uuserinfo);
        return "uuserList";
    }

    @RequestMapping("userIndex")
    public String userIndex(){
        return "userIndex";
    }
}
