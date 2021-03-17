package com.sw.warehouse.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity(name = "warehouseinfo")
@EntityListeners(AuditingEntityListener.class)
@Data
public class Warehouseinfo implements Serializable {

    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 仓库名称
     */
    private String warehousename;

    /**
     * 仓库照片
     */
    private String photo;

    /**
     * 数量
     */
    private Integer amount;

    /**
     * 备注
     */
    private String intro;

    /**
     * 创建时间
     */
    @CreatedDate
    @Column(name = "createtime", updatable = false, nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

}

