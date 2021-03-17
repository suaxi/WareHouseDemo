package com.sw.warehouse.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity(name = "stockinfo")
@Data
public class Stockinfo implements Serializable {

    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 名称
     */
    private String name;

    /**
     * 所属仓库
     */
    private Integer warehouseid;

    /**
     * 所属供应商
     */
    private Integer supplierid;

    /**
     * 价格
     */
    private String price;

    /**
     * 数量
     */
    private Integer amount;

    /**
     * 类别
     */
    private String sort;

}

