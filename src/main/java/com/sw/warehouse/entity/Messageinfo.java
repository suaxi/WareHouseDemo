package com.sw.warehouse.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity(name = "messageinfo")
@EntityListeners(AuditingEntityListener.class)
public class Messageinfo {
	@Id //主键
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	//ID 
	private String msg;	//信息反馈
	@CreatedDate
	@Column(name = "createtime",updatable = false,nullable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createtime;	//提交时间 

	public Messageinfo (){

	}

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}

	public void setMsg(String msg){
		this.msg=msg;
	}
	public String getMsg(){
		return msg;
	}

	public void setCreatetime(Date createtime){
		this.createtime=createtime;
	}
	public Date getCreatetime(){
		return createtime;
	}

	@Override
	public String toString(){
		return " Messageinfo [id=" + id+ " , msg=" + msg+ " , createtime=" + createtime+"]";
	}

}

