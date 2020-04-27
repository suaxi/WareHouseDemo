package com.sw.warehouse.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="supplierinfo") //表名
public class Supplierinfo {
	@Id //主键
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	//ID 
	private String suppliername;	//供应商 
	private String supplier;	//联系人 
	private String phone;	//电话 
	private String intro;	//备注 

	public Supplierinfo (){

	}

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}

	public void setSuppliername(String suppliername){
		this.suppliername=suppliername;
	}
	public String getSuppliername(){
		return suppliername;
	}

	public void setSupplier(String supplier){
		this.supplier=supplier;
	}
	public String getSupplier(){
		return supplier;
	}

	public void setPhone(String phone){
		this.phone=phone;
	}
	public String getPhone(){
		return phone;
	}

	public void setIntro(String intro){
		this.intro=intro;
	}
	public String getIntro(){
		return intro;
	}

	@Override
	public String toString(){
		return " Supplierinfo [id=" + id+ " , suppliername=" + suppliername+ " , supplier=" + supplier+ " , phone=" + phone+ " , intro=" + intro+"]";
	}

}

