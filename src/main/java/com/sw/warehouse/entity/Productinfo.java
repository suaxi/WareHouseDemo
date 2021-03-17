package com.sw.warehouse.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity(name = "productinfo")
@EntityListeners(AuditingEntityListener.class)
@Data
public class Productinfo implements Serializable {

    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 名称
     */
    private String productname;

    /**
     * 所属仓库
     */
    private String warehousename;

    /**
     * 所属供应商
     */
    private String suppliername;

    /**
     * 价格
     */
    private double price;

    /**
     * 数量
     */
    private Integer amount;

    /**
     * 备注
     */
    private String intro;

    /**
     * 出入/库状态
     */
    private String status;
    @CreatedDate
    @Column(name = "createtime", updatable = false, nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

}

