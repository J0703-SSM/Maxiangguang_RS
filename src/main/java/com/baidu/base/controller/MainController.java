package com.baidu.base.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dllo on 17/11/10.
 */
@Controller
public class MainController {

    @RequestMapping("/")
    public String home(){
        return "login";
    }

    @RequestMapping("/login")
    public String login(){

        return "index";
    }

    @RequestMapping("/index")
    public String index(){
        return "index";
    }


    @RequestMapping("/role_list")
    public String roleList(){
        return "role/role_list";
    }

    @RequestMapping("/admin_list")
    public String adminList(){
        return "admin/admin_list";
    }


    @RequestMapping("/account_list")
    public String accountList(){
        return "account/account_list";
    }

    @RequestMapping("/service_list")
    public String serviceList(){

        return "service/service_list";
    }

    @RequestMapping("/bill_list")
    public String billList(){
        return "bill/bill_list";
    }

    @RequestMapping("/report_list")
    public String reportList(){
        return "report/report_list";
    }

    @RequestMapping("/user_info")
    public String userList(){
        return "user/user_info";
    }

    @RequestMapping("/user_modi_pwd")
    public String user_modi_pwd(){
        return "user/user_modi_pwd";
    }






}
