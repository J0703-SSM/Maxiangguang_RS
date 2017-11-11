package com.baidu.cost.mapper;

import com.baidu.cost.domain.Cost;

import java.util.List;

public interface CostMapper {
    int deleteByPrimaryKey(Integer costid);

    int insert(Cost record);

    int insertSelective(Cost record);

    Cost selectByPrimaryKey(Integer costid);

    List<Cost> findAll(Cost record);

    int updateByPrimaryKeySelective(Cost record);

    int updateByPrimaryKey(Cost record);
}