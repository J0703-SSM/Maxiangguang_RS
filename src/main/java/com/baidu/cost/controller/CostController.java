package com.baidu.cost.controller;

import com.baidu.base.domain.PageBean;
import com.baidu.cost.domain.Cost;
import com.baidu.cost.service.CostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.Date;
import java.util.List;

/**
 * Created by dllo on 17/11/10.
 */
@Controller
public class CostController {

    @Qualifier("costService")
    @Autowired
    private CostService costService;


    /**
     * 查询所有
     */
    @RequestMapping("/fee_list")
    public String feeList(Model model) {

        List<Cost> costList = costService.findAll();

        model.addAttribute("costList", costList);
        return "fee/fee_list";
    }

    /**
     * 添加前的页面跳转
     *
     * @return
     */
    @RequestMapping("/preparedAdd")
    public String preparedAdd() {
        return "fee/fee_add";
    }

    /**
     * 添加
     */
    @RequestMapping("/feeAdd")
    public String feeAdd(Cost cost, Model model, PageBean<Cost> pageBean) {

        System.out.println(cost);
        // 添加创建时间和使用状态
        cost.setCreateTime(new Date());
        cost.setStatus(0);

        costService.insert(cost);

        getPageProperties(pageBean);


        model.addAttribute("pageBean", costService.findAll(pageBean));

        return "/fee/fee_list";
    }

    /**
     * 套餐的启用
     */
    @RequestMapping("/startFee")
    public String startFee(Cost cost, Model model) {

        // 根据id查询该资费类型
        Cost cost1 = costService.findById(cost.getCostId());
        cost1.setStartTime(new Date());

        // 修改状态
        costService.updateStatus(cost1);

        return "/fee/fee_list";
    }

    @RequestMapping("/updatePrepared")
    public String updateStatusPrepared(Cost cost, Model model) {
        System.out.println(cost);

        Cost byId = costService.findById(cost.getCostId());

        model.addAttribute("cost", byId);

        return "fee/fee_modi";
    }

    /**
     * 更改资费管理
     */
    @RequestMapping("/updateFee")
    public String update(Cost cost, Model model){

        System.out.println(cost);

        Cost byId = costService.findById(cost.getCostId());

        cost.setStartTime(byId.getStartTime());
        cost.setCreateTime(byId.getCreateTime());
        cost.setStatus(byId.getStatus());

        costService.update(cost);

        return "fee/fee_list";
    }

    /**
     * 删除
     *
     */
    @RequestMapping("/deleteFee")
    public String deleteById(Cost cost){

        costService.deleteById(cost.getCostId());
        return "fee/fee_list";
    }

    /**
     * 分页
     * @return
     */
    @RequestMapping("/findAllFee")
    public String findAll(PageBean<Cost> pageBean, Model model){

        // 将查询参数封装到pageBean中
        getPageProperties(pageBean);

        pageBean = costService.findAll(pageBean);

        model.addAttribute("pageBean", pageBean);

        return "fee/fee_list";
    }

    /**
     *  设置pageBean的参数
     * @param pageBean
     */
    private void getPageProperties(PageBean<Cost> pageBean) {
        int pc = pageBean.getPc();
        // 如果pc小于等于0, 令其等于1
        if (pc <= 0){
            pageBean.setPc(1);
        }
        // 显示五条
        pageBean.setPs(5);

        // 设置url, 用于点击页面查询
        pageBean.setUrl("/findAllFee");
    }

    /**
     * 根据baseDuration排序
     */
    @RequestMapping("/feeOrderByBaseDuration")
    public String feeOrderByBaseDuration(PageBean<Cost> pageBean,String rankBaseC,
                                         String rankBaseD, Model model) {

        System.out.println(rankBaseD);
        System.out.println(rankBaseC);
        System.out.println(pageBean);

        getPageProperties(pageBean);

        pageBean = costService.Order(rankBaseD, rankBaseC, pageBean);

        model.addAttribute("pageBean", pageBean);

        return "fee/fee_list";
    }

}
