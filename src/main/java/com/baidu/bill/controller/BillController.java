package com.baidu.bill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dllo on 17/11/15.
 */
@Controller
@RequestMapping("/bill")
public class BillController {

    @RequestMapping("/bill_list")
    public String billList() {
        return "bill/bill_list";
    }

}
