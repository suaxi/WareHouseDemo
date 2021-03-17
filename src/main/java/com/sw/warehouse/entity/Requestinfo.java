package com.sw.warehouse.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.annotation.LastModifiedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity(name = "requestinfo")
@EntityListeners(AuditingEntityListener.class)
@Data
public class Requestinfo implements Serializable {

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
     * 仓库
     */
    private String warehousename;

    /**
     * 供应商
     */
    private String suppliername;

    /**
     * 价格
     */
    private Double price;

    /**
     * 数量
     */
    private Integer amount;

    /**
     * 出入库操作
     */
    private String operating;

    /**
     * 类别
     */
    private String intro;

    /**
     * 备注
     */
    private String msg;

    /**
     * 提交时间
     */
    @CreatedDate
    @Column(name = "createtime", updatable = false, nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

    /**
     * 处理状态
     */
    private Integer status;

    /**
     * 操作时间
     */
    @LastModifiedDate
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "dealtime", nullable = false)
    private Date dealtime;

    /**
     * 工单状态
     */
    private Integer statuscheck;

}

