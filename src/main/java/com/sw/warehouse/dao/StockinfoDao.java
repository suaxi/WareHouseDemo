package com.sw.warehouse.dao;

import com.sw.warehouse.entity.Stockinfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

public interface StockinfoDao
        extends JpaRepository<Stockinfo,Integer> {

    @Transactional
    @Modifying
    @Query(value = "UPDATE stockinfo s,productinfo p SET s.amount=s.amount+p.amount\n" +
            "WHERE s.name=?\n" +
            "AND p.productname=?\n" +
            "AND p.amount=(\n" +
            "SELECT amount\n" +
            "FROM productinfo\n" +
            "WHERE createtime=(\n" +
            "SELECT MAX(createtime)\n" +
            "FROM productinfo\n" +
            "WHERE productname=?)\n" +
            ")",nativeQuery = true)
    void increaseStock(String name,String productname,String productname1);

    @Transactional
    @Modifying
    @Query(value = "UPDATE stockinfo s,productinfo p SET s.amount=s.amount-p.amount\n" +
            "WHERE s.name=?\n" +
            "AND p.productname=?\n" +
            "AND p.amount=(\n" +
            "SELECT amount\n" +
            "FROM productinfo\n" +
            "WHERE createtime=(\n" +
            "SELECT MAX(createtime)\n" +
            "FROM productinfo\n" +
            "WHERE productname=?)\n" +
            ")",nativeQuery = true)
    void reduceStock(String name,String productname,String productname1);

    @Transactional
    @Query(value = "SELECT amount\n" +
            "FROM stockinfo\n" +
            "WHERE name=?",nativeQuery = true)
    int queryStockByName(String name);
}
