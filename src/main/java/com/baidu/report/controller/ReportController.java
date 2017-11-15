package com.baidu.report.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by dllo on 17/11/15.
 */
@Controller
@RequestMapping("/report")
public class ReportController {


    @RequestMapping("/report_list")
    public String reportList() {
        return "report/report_list";
    }
}
