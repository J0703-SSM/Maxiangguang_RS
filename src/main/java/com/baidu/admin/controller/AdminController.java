package com.baidu.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dllo on 17/11/13.
 */
@Controller
public class AdminController {


    @RequestMapping("/role_list")
    public String roleList(){
        return "role/role_list";
    }

    @RequestMapping("/admin_list")
    public String adminList(){
        return "admin/admin_list";
    }



}
