package com.sw.warehouse.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity(name="useruploadinfo") //表名
@EntityListeners(AuditingEntityListener.class)
public class Useruploadinfo {
    @Id //主键
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	//ID
	private Integer result;	//结果 1:成功0：失败 
	private String msg;	//信息
	private String picurl; //相对路径
	private String filepath;  //绝对路径
    @CreatedDate
    @Column(name = "createtime",updatable = false,nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createtime;	//上传时间 

	public Useruploadinfo(){

	}

    public void successful(String picurl,String filepath){
        this.result=1;
        this.msg= "上传成功！";
        this.picurl=picurl;
        this.filepath=filepath;
    }

    public void failed(){
        this.result=0;
        this.msg="上传失败！";
    }


	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}

	public void setResult(Integer result){
		this.result=result;
	}
	public Integer getResult(){
		return result;
	}

	public void setMsg(String msg){
		this.msg=msg;
	}
	public String getMsg(){
		return msg;
	}

	public String getPicurl() {
		return picurl;
	}

	public void setPicurl(String picurl) {
		this.picurl = picurl;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public void setCreatetime(Date createtime){
		this.createtime=createtime;
	}
	public Date getCreatetime(){
		return createtime;
	}

	@Override
	public String toString(){
		return " Uploadresult [id=" + id+ " , result=" + result+ " , msg=" + msg+ " , picurl=" + picurl+ " , createtime=" + createtime+"]";
	}

}

