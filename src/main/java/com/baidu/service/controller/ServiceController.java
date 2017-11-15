package com.baidu.service.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dllo on 17/11/15.
 */
@Controller
@RequestMapping("/service")
public class ServiceController {


    @RequestMapping("/service_list")
    public String serviceList() {

        return "service/service_list";
    }
}
