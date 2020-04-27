package com.sw.warehouse.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.util.Date;

@Entity(name = "syslog")
public class Syslog {
	@Id //主键
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	//ID 
	private String username;	//用户名 
	private String operation;	//操作 
	private String method;	//方法名 
	private String params;	//参数 
	private String ip;	//ip地址
	@DateTimeFormat(pattern = "yyyy-MM-dd HH-mm-ss")
	private Date createtime;	//操作时间 

	public Syslog (){

	}

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}

	public void setUsername(String username){
		this.username=username;
	}
	public String getUsername(){
		return username;
	}

	public void setOperation(String operation){
		this.operation=operation;
	}
	public String getOperation(){
		return operation;
	}

	public void setMethod(String method){
		this.method=method;
	}
	public String getMethod(){
		return method;
	}

	public void setParams(String params){
		this.params=params;
	}
	public String getParams(){
		return params;
	}

	public void setIp(String ip){
		this.ip=ip;
	}
	public String getIp(){
		return ip;
	}

	public void setCreatetime(Date createtime){
		this.createtime=createtime;
	}
	public Date getCreatetime(){
		return createtime;
	}

	@Override
	public String toString(){
		return " Syslog [id=" + id+ " , username=" + username+ " , operation=" + operation+ " , method=" + method+ " , params=" + params+ " , ip=" + ip+ " , createtime=" + createtime+"]";
	}

}

