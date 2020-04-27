package com.sw.warehouse.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity(name="warehouseinfo") //表名
@EntityListeners(AuditingEntityListener.class)
public class Warehouseinfo {
	@Id //主键
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	//ID 
	private String warehousename;	//仓库名称 
	private String photo;	//仓库图片
	private Integer amount;	//数量 
	private String intro;	//备注
	@CreatedDate
	@Column(name = "createtime",updatable = false,nullable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createtime;	//创建时间 

	public Warehouseinfo (){

	}

	public void setId(Integer id){
		this.id=id;
	}
	public Integer getId(){
		return id;
	}

	public void setWarehousename(String warehousename){
		this.warehousename=warehousename;
	}
	public String getWarehousename(){
		return warehousename;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
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

	public void setCreatetime(Date createtime){
		this.createtime=createtime;
	}
	public Date getCreatetime(){
		return createtime;
	}

	@Override
	public String toString() {
		return "Warehouseinfo{" +
				"id=" + id +
				", warehousename='" + warehousename + '\'' +
				", photo='" + photo + '\'' +
				", amount=" + amount +
				", intro='" + intro + '\'' +
				", createtime=" + createtime +
				'}';
	}
}

