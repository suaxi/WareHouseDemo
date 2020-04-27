package com.sw.warehouse.dao;

import com.sw.warehouse.entity.Requestinfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


public interface RequestinfoDao
        extends JpaRepository<Requestinfo,Integer> {

    @Transactional
    @Modifying
    @Query(value = "UPDATE requestinfo SET statuscheck=1 WHERE id=?",nativeQuery = true)
    void checkstatus(Integer id);

    @Transactional
    @Query(value = "SELECT COUNT(id)\n" +
            "FROM requestinfo\n" +
            "WHERE status IS NULL",nativeQuery = true)
    int checkRequest();
}
