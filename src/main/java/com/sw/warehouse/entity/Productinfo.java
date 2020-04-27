package com.sw.warehouse.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity(name="productinfo") //表名
@EntityListeners(AuditingEntityListener.class)
public class Productinfo {
	@Id //主键
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	//ID 
	private String productname;	//名称
	private String warehousename;	//所属仓库
	private String suppliername;	//所属供应商
	private double price;	//价格 
	private Integer amount;	//数量 
	private String intro;	//备注 
	private String status;	//出入/库状态
	@CreatedDate
	@Column(name = "createtime",updatable = false,nullable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createtime;	//操作时间

	public Productinfo (){

	}

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}

	public void setProductname(String productname){
		this.productname=productname;
	}
	public String getProductname(){
		return productname;
	}

	public void setWarehousename(String warehousename){
		this.warehousename=warehousename;
	}
	public String getWarehousename(){
		return warehousename;
	}

	public void setSuppliername(String suppliername){
		this.suppliername=suppliername;
	}
	public String getSuppliername(){
		return suppliername;
	}

	public void setPrice(double price){
		this.price=price;
	}
	public double getPrice(){
		return price;
	}

	public void setAmount(Integer amount){
		this.amount=amount;
	}
	public Integer getAmount(){
		return amount;
	}

	public void setIntro(String intro){
		this.intro=intro;
	}
	public String getIntro(){
		return intro;
	}

	public void setStatus(String status){
		this.status=status;
	}
	public String getStatus(){
		return status;
	}

	public void setCreatetime(Date createtime){
		this.createtime=createtime;
	}
	public Date getCreatetime(){
		return createtime;
	}

	@Override
	public String toString(){
		return " Productinfo [id=" + id+ " , productname=" + productname+ " , warehousename=" + warehousename+ " , suppliername=" + suppliername+ " , price=" + price+ " , amount=" + amount+ " , intro=" + intro+ " , status=" + status+ " , createtime=" + createtime+"]";
	}

}

