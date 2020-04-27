package com.sw.warehouse.dao;

import com.sw.warehouse.entity.Supplierinfo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SupplierinfoDao
        extends JpaRepository<Supplierinfo,Integer> {
}
