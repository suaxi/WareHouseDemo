package com.sw.warehouse.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity(name="stockinfo") //表名
public class Stockinfo {
	@Id //主键
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	//ID 
	private String name;	//名称
	private Integer warehouseid;	//所属仓库 
	private Integer supplierid;	//所属供应商 
	private String price;	//价格 
	private Integer amount;	//数量 
	private String sort;	//类别 

	public Stockinfo (){

	}

	public Stockinfo(String name) {
		this.name = name;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getWarehouseid() {
		return warehouseid;
	}

	public void setWarehouseid(Integer warehouseid) {
		this.warehouseid = warehouseid;
	}

	public Integer getSupplierid() {
		return supplierid;
	}

	public void setSupplierid(Integer supplierid) {
		this.supplierid = supplierid;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Integer getAmount() {
		return amount;
	}

	public void setAmount(Integer amount) {
		this.amount = amount;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "Stockinfo{" +
				"id=" + id +
				", name='" + name + '\'' +
				", warehouseid=" + warehouseid +
				", supplierid=" + supplierid +
				", price='" + price + '\'' +
				", amount=" + amount +
				", sort='" + sort + '\'' +
				'}';
	}
}

