package com.baidu.cost.service;

import com.baidu.base.domain.PageBean;
import com.baidu.cost.domain.Cost;
import com.baidu.cost.domain.PageBeanEx;

import java.util.List;

/**
 * Created by dllo on 17/11/11.
 */
public interface CostService {

    int insert(Cost record);


    List<Cost> findAll();


    PageBeanEx Order(PageBeanEx pageBean);

    void updateStatus(Cost cost);

    Cost findById(Integer costId);

    void update(Cost cost);

    void deleteById(Integer costId);

    PageBeanEx findAll(PageBeanEx pageBean);
}
