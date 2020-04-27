package com.sw.warehouse.controller;

import com.sw.warehouse.util.IpUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
public class IpController {
    @RequestMapping(value = "/getIp",method = RequestMethod.POST)
    public String getIp(HttpServletRequest request){
        return IpUtils.getIpAddr(request);
    }
}
