package com.baidu.cost.service;

import com.baidu.base.domain.PageBean;
import com.baidu.cost.domain.Cost;

import java.util.List;

/**
 * Created by dllo on 17/11/11.
 */
public interface CostService {

    int insert(Cost record);


    List<Cost> findAll();


    PageBean<Cost> Order(String rankBaseD,String rankBaseC, PageBean<Cost> pageBean);

    void updateStatus(Cost cost);

    Cost findById(Integer costId);

    void update(Cost cost);

    void deleteById(Integer costId);

    PageBean<Cost> findAll(PageBean<Cost> pageBean);
}
