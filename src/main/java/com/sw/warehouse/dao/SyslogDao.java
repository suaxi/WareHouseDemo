package com.sw.warehouse.dao;

import com.sw.warehouse.entity.Syslog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SyslogDao
        extends JpaRepository<Syslog,Integer> {
}
