package com.sw.warehouse.dao;

import com.sw.warehouse.entity.Warehouseinfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface WarehouseinfoDao
        extends JpaRepository<Warehouseinfo,Integer> {

    @Transactional
    @Modifying
    @Query(value = "UPDATE warehouseinfo w,whuploadinfo u SET w.photo=u.picurl WHERE w.createtime=u.createtime",nativeQuery = true)
    void savepicurl();
}
