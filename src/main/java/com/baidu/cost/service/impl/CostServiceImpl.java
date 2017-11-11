package com.baidu.cost.service.impl;

import com.baidu.cost.domain.Cost;
import com.baidu.cost.mapper.CostMapper;
import com.baidu.cost.service.CostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/11/11.
 */
@Service("costService")
public class CostServiceImpl implements CostService {

    @Resource
    private CostMapper costMapper;

    @Override
    public int deleteByPrimaryKey(Integer costid) {
        return costMapper.deleteByPrimaryKey(costid);
    }

    @Override
    public int insert(Cost record) {
        return costMapper.insert(record);
    }

    @Override
    public int insertSelective(Cost record) {
        return costMapper.insertSelective(record);
    }

    @Override
    public Cost selectByPrimaryKey(Integer costid) {
        return costMapper.selectByPrimaryKey(costid);
    }

    @Override
    public List<Cost> findAll(Cost record) {
        return costMapper.findAll(record);
    }

    @Override
    public int updateByPrimaryKeySelective(Cost record) {
        return costMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(Cost record) {
        return costMapper.updateByPrimaryKey(record);
    }
}
