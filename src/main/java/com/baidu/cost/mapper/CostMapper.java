package com.baidu.cost.mapper;

import com.baidu.base.domain.PageBean;
import com.baidu.cost.domain.Cost;

import java.util.List;

public interface CostMapper {
    int deleteById(Integer costId);

    int insert(Cost record);

    List<Cost> findAll();

//    List<Cost> orderByBaseDuration(List<String> params);
    List<Cost> orderByBaseDuration(String rankBaseD, String rankBaseC);

    void updateStatus(Cost cost);

    Cost findById(Integer costId);

    void update(Cost cost);

    List<Cost> findAll1(PageBean<Cost> pageBean);
}