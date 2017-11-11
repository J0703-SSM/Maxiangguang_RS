package com.baidu.cost.service;

import com.baidu.cost.domain.Cost;

import java.util.List;

/**
 * Created by dllo on 17/11/11.
 */
public interface CostService {

    int deleteByPrimaryKey(Integer costid);

    int insert(Cost record);

    int insertSelective(Cost record);

    Cost selectByPrimaryKey(Integer costid);

    List<Cost> findAll(Cost record);

    int updateByPrimaryKeySelective(Cost record);

    int updateByPrimaryKey(Cost record);


}
