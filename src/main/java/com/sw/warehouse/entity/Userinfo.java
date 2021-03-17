package com.sw.warehouse.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Data
@Entity(name = "userinfo")
@EntityListeners(AuditingEntityListener.class)
public class Userinfo implements Serializable {

    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 姓名
     */
    private String username;

    /**
     * 照片
     */
    private String photo;

    /**
     * 性别
     */
    private String sex;

    /**
     * 身份证
     */
    private String idnumber;

    /**
     * 电话
     */
    private String phone;

    /**
     * 地址
     */
    private String address;

    /**
     * 角色
     */
    private String role;

    /**
     * 密码
     */
    private String password;

    /**
     * 备注
     */
    private String intro;

    /**
     * 入职时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date entrytime;

    /**
     * 添加信息时间
     */
    @CreatedDate
    @Column(name = "createtime", updatable = false, nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

}

