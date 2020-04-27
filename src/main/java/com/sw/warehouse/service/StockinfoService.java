package com.sw.warehouse.service;

import com.sw.warehouse.dao.StockinfoDao;
import com.sw.warehouse.entity.Stockinfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StockinfoService {
    @Autowired
    StockinfoDao stockinfoDao;
    public int queryStock(String name){
        int result=0;
        try {
            result=stockinfoDao.queryStockByName(name);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
