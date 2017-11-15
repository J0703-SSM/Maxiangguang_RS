package com.baidu.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dllo on 17/11/15.
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @RequestMapping("/account_list")
    public String accountList() {
        return "account/account_list";
    }
}
