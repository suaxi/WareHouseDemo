package com.sw.warehouse.entity;

import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity(name="userinfo") //表名
@EntityListeners(AuditingEntityListener.class)
public class Userinfo {
	@Id //主键
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;	//ID 
	private String username;	//姓名
	private String photo; //照片
	private String sex;	//性别 
	private String idnumber;	//身份证 
	private String phone;	//电话 
	private String address;	//地址 
	private String role;	//角色 
	private String password;	//密码 
	private String intro;	//备注
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date entrytime; //入职时间
	@CreatedDate
	@Column(name = "createtime",updatable = false,nullable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date createtime;	//添加纪录时间

	public Userinfo() {
	}

	public Userinfo(String username, String password) {
		this.username = username;
		this.password = password;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdnumber() {
		return idnumber;
	}

	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Date getEntrytime() {
		return entrytime;
	}

	public void setEntrytime(Date entrytime) {
		this.entrytime = entrytime;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	@Override
	public String toString() {
		return "Userinfo{" +
				"id=" + id +
				", username='" + username + '\'' +
				", photo='" + photo + '\'' +
				", sex='" + sex + '\'' +
				", idnumber='" + idnumber + '\'' +
				", phone='" + phone + '\'' +
				", address='" + address + '\'' +
				", role='" + role + '\'' +
				", password='" + password + '\'' +
				", intro='" + intro + '\'' +
				", entrytime=" + entrytime +
				", createtime=" + createtime +
				'}';
	}
}

