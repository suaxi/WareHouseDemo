package com.sw.warehouse.controller;

import com.sw.warehouse.annotation.SysControllerLog;
import com.sw.warehouse.dao.UseruploadinfoDao;
import com.sw.warehouse.dao.WhuploadinfoDao;
import com.sw.warehouse.entity.Useruploadinfo;
import com.sw.warehouse.entity.Whuploadinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;


@Controller
public class UploadController {

    //上传用户图片
    @Autowired
    UseruploadinfoDao useruploadinfoDao;
    private String picurl;
    private String filePath;
    private String fileType;

    @RequestMapping(value = "/userUpload",produces="application/json;charset=UTF-8")
    @ResponseBody
    @SysControllerLog(description = "上传用户头像")
    public Useruploadinfo fileUpload(MultipartFile file){
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String fileName = UUID.randomUUID() + suffix;
        //绝对路径
        filePath = "C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\user";
        String newFilePath = filePath + "\\" + fileName;
        //System.out.println("文件路径："+newFilePath);
        //上传图片的类型
        fileType = "jpeg,jpg,png";
        String[] typeArray=fileType.split(",");
        //System.out.println("type:"+typeArray.length);
        //相对路径
        picurl="http://localhost:8088/upload/user/"+fileName;
        //System.out.println("相对路径："+picurl);
        Useruploadinfo user = new Useruploadinfo();
        File saveFile = new File(newFilePath);
        if(!saveFile.getParentFile().exists()){
            saveFile.getParentFile().mkdirs();
        }
        try {
            file.transferTo(saveFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (file == null){
            user.failed();
            useruploadinfoDao.save(user);
            return user;
        }else {
            user.successful(picurl,filePath);
            useruploadinfoDao.save(user);
            return user;
        }
    }

    //上传仓库图片
    @Autowired
    WhuploadinfoDao whuploadinfoDao;
    private String picurl1;
    private String filePath1;
    private String fileType1;

    @RequestMapping(value = "/whWpload",produces="application/json;charset=UTF-8")
    @ResponseBody
    @SysControllerLog(description = "上传仓库照片")
    public Whuploadinfo fileUpload1(MultipartFile file){
        String suffix = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
        String fileName = UUID.randomUUID() + suffix;
        //绝对路径
        filePath1 = "C:\\Users\\Suaxi\\IdeaProjects\\warehouse\\src\\main\\resources\\static\\upload\\warehouse";
        String newFilePath = filePath1 + "\\" + fileName;
        //System.out.println("文件路径："+newFilePath);
        //上传图片的类型
        fileType1 = "jpeg,jpg,png";
        String[] typeArray=fileType1.split(",");
        //System.out.println("type:"+typeArray.length);
        //相对路径
        picurl1="http://localhost:8088/upload/warehouse/"+fileName;
        //System.out.println("相对路径："+picurl);
        Whuploadinfo wh = new Whuploadinfo();
        File saveFile = new File(newFilePath);
        if(!saveFile.getParentFile().exists()){
            saveFile.getParentFile().mkdirs();
        }
        try {
            file.transferTo(saveFile);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (file == null){
            wh.failed();
            whuploadinfoDao.save(wh);
            return wh;
        }else {
            wh.successful(picurl1,filePath1);
            whuploadinfoDao.save(wh);
            return wh;
        }
    }
}
