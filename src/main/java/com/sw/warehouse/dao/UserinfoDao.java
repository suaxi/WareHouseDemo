package com.sw.warehouse.dao;

import com.sw.warehouse.entity.Userinfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface UserinfoDao
        extends JpaRepository<Userinfo,Integer> {
                            //操作的表，主键

    @Transactional
    @Modifying
    @Query(value = "UPDATE userinfo r,useruploadinfo u SET r.photo=u.picurl WHERE r.createtime=u.createtime",nativeQuery = true)
    void savepicurl();
}
