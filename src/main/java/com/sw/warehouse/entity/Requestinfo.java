package com.sw.warehouse.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity(name="requestinfo") //表名
@EntityListeners(AuditingEntityListener.class)
public class Requestinfo {
	@Id //主键
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	//ID
	private String productname;	//名称 
	private String warehousename;	//仓库 
	private String suppliername;	//供应商 
	private Double price;	//价格
	private Integer amount;	//数量 
	private String operating;	//出/入库操作 
	private String intro;	//类别 
	private String msg;	//备注
	@CreatedDate
	@Column(name = "createtime",updatable = false,nullable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createtime;	//提交时间 
	private Integer status;	//处理状态
	@LastModifiedDate
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@Column(name = "dealtime",nullable = false)
	private Date dealtime;	//操作时间
	private Integer statuscheck;	//工单状态

	public Requestinfo (){

	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public String getWarehousename() {
		return warehousename;
	}

	public void setWarehousename(String warehousename) {
		this.warehousename = warehousename;
	}

	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getOperating() {
		return operating;
	}

	public void setOperating(String operating) {
		this.operating = operating;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Date getDealtime() {
		return dealtime;
	}

	public void setDealtime(Date dealtime) {
		this.dealtime = dealtime;
	}

	public Integer getStatuscheck() {
		return statuscheck;
	}

	public void setStatuscheck(Integer statuscheck) {
		this.statuscheck = statuscheck;
	}

	@Override
	public String toString() {
		return "Requestinfo{" +
				"id=" + id +
				", productname='" + productname + '\'' +
				", warehousename='" + warehousename + '\'' +
				", suppliername='" + suppliername + '\'' +
				", price=" + price +
				", amount=" + amount +
				", operating='" + operating + '\'' +
				", intro='" + intro + '\'' +
				", msg='" + msg + '\'' +
				", createtime=" + createtime +
				", status=" + status +
				", dealtime=" + dealtime +
				", statuscheck=" + statuscheck +
				'}';
	}
}

