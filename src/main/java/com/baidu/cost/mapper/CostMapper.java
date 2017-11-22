package com.baidu.cost.mapper;

import com.baidu.base.domain.PageBean;
import com.baidu.cost.domain.Cost;
import com.baidu.cost.domain.PageBeanEx;

import java.util.List;

public interface CostMapper {
    int deleteById(Integer costId);

    int insert(Cost record);

    List<Cost> findAll();

    List<Cost> order(PageBeanEx pageBean);

    void updateStatus(Cost cost);

    Cost findById(Integer costId);

    void update(Cost cost);

    List<Cost> findAll1(PageBean<Cost> pageBean);
}