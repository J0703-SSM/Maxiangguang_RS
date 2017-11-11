package com.baidu.cost.controller;

import com.baidu.cost.domain.Cost;
import com.baidu.cost.service.CostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by dllo on 17/11/10.
 */
@Controller
public class CostController {

    @Qualifier("costService")
    @Autowired
    private CostService costService;



    @RequestMapping("/fee_list")
    public String feeList(Cost record,Model model){

        List<Cost> costList = costService.findAll(record);

        for (Cost cost : costList) {
            System.out.println(cost);
        }

        model.addAttribute("costList",costList);
        return "fee/fee_list";
    }

    @RequestMapping("/feeOrderByBaseDuration")
    public String feeOrderByBaseDuration(Cost cost, String des){

        System.out.println(cost);
        System.out.println(des);

        List<Cost> costList = costService.findAll(cost);

        return "fee/fee_list";
    }


}
