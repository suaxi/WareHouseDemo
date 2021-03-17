package com.sw.warehouse.entity;

import lombok.Data;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import java.io.Serializable;

@Entity(name = "supplierinfo")
@Data
public class Supplierinfo implements Serializable {

    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 供应商
     */
    private String suppliername;

    /**
     * 联系人
     */
    private String supplier;

    /**
     * 电话
     */
    private String phone;

    /**
     * 备注
     */
    private String intro;

}

