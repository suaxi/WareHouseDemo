package com.sw.warehouse.controller;

import com.sw.warehouse.annotation.SysControllerLog;
import com.sw.warehouse.dao.ProductinfoDao;
import com.sw.warehouse.dao.RequestinfoDao;
import com.sw.warehouse.dao.StockinfoDao;
import com.sw.warehouse.entity.Productinfo;
import com.sw.warehouse.entity.Requestinfo;
import com.sw.warehouse.entity.Stockinfo;
import com.sw.warehouse.util.ExportExcel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
public class ExcelController {
    //导出库存信息Excel
    @Autowired
    StockinfoDao stockinfoDao;
    @RequestMapping("/exportStock")
    @SysControllerLog(description = "库存信息Excel")
    public String getStock(HttpServletResponse response) throws Exception {
        //填充list数据
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        String fileName = "库存信息" + sf.format(new Date()) + ".xlsx";
        // 获取数据来源
        List<Stockinfo> stock = stockinfoDao.findAll();
        String[] columnName = new String[]{"编号", "名称", "所属仓库", "所属供应商", "价格", "数量","备注"};
        String[] keys = new String[]{"id", "name", "warehouseid", "supplierid", "price", "amount","sort"};
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ExportExcel.createWorkBook(stock, keys, columnName, Stockinfo.class).write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] content = os.toByteArray();
        ByteArrayInputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes("gbk"), "iso8859-1"));
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
        return null;
    }

    //导出货品存储信息Excel
    @Autowired
    ProductinfoDao productinfoDao;
    @RequestMapping("/exportProduct")
    @SysControllerLog(description = "出/入库信息Excel")
    public String getProduct(HttpServletResponse response) throws Exception {
        //填充list数据
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        String fileName = "出/入库信息" + sf.format(new Date()) + ".xlsx";
        // 获取数据来源
        List<Productinfo> product = productinfoDao.findAll();
        String[] columnName = new String[]{"编号", "名称", "所属仓库", "所属供应商", "价格", "数量","备注","状态：1入库-1出库","操作时间"};
        String[] keys = new String[]{"id", "productname", "warehousename", "suppliername", "price", "amount","intro","status","createtime"};
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ExportExcel.createWorkBook(product, keys, columnName, Productinfo.class).write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] content = os.toByteArray();
        ByteArrayInputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes("gbk"), "iso8859-1"));
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
        return null;
    }

    //导出工单Excel
    @Autowired
    RequestinfoDao requestinfoDao;
    @RequestMapping("/exportRequest")
    @SysControllerLog(description = "导出工单Excel")
    public String getRequest(HttpServletResponse response) throws Exception {
        //填充list数据
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        String fileName = "工单信息" + sf.format(new Date()) + ".xlsx";
        // 获取数据来源
        List<Requestinfo> request = requestinfoDao.findAll();
        String[] columnName = new String[]{"编号", "名称", "仓库", "供应商", "价格", "数量", "操作", "类别", "备注", "处理时间", "状态：1完成/Null未完成"};
        String[] keys = new String[]{"id", "productname","warehousename","suppliername","price", "amount",  "intro","msg", "dealtime", "statuscheck"};
        ByteArrayOutputStream os = new ByteArrayOutputStream();
        try {
            ExportExcel.createWorkBook(request, keys, columnName, Requestinfo.class).write(os);
        } catch (IOException e) {
            e.printStackTrace();
        }
        byte[] content = os.toByteArray();
        ByteArrayInputStream is = new ByteArrayInputStream(content);
        // 设置response参数，可以打开下载页面
        response.reset();
        response.setContentType("application/vnd.ms-excel;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + new String(fileName.getBytes("gbk"), "iso8859-1"));
        ServletOutputStream out = response.getOutputStream();
        BufferedInputStream bis = null;
        BufferedOutputStream bos = null;
        try {
            bis = new BufferedInputStream(is);
            bos = new BufferedOutputStream(out);
            byte[] buff = new byte[2048];
            int bytesRead;
            while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
                bos.write(buff, 0, bytesRead);
            }
        } catch (final IOException e) {
            throw e;
        } finally {
            if (bis != null)
                bis.close();
            if (bos != null)
                bos.close();
        }
        return null;
    }
}
