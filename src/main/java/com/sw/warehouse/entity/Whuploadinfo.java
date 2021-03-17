package com.sw.warehouse.entity;

import lombok.Data;
import org.springframework.data.annotation.CreatedDate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity(name = "whuploadinfo")
@EntityListeners(AuditingEntityListener.class)
@Data
public class Whuploadinfo implements Serializable {

    /**
     * ID
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 结果  1:成功 0：失败
     */
    private Integer result;

    /**
     * 信息
     */
    private String msg;

    /**
     * 相对路径
     */
    private String picurl;

    /**
     * 绝对路径
     */
    private String filepath;

    /**
     * 上传时间
     */
    @CreatedDate
    @Column(name = "createtime", updatable = false, nullable = false)
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createtime;

}

