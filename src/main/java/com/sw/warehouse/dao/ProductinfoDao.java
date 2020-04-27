package com.sw.warehouse.dao;

import com.sw.warehouse.entity.Productinfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductinfoDao
        extends JpaRepository<Productinfo,Integer> {
}
