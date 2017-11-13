package com.baidu.cost.service.impl;

import com.baidu.base.domain.PageBean;
import com.baidu.cost.domain.Cost;
import com.baidu.cost.mapper.CostMapper;
import com.baidu.cost.service.CostService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by dllo on 17/11/11.
 */
@Service("costService")
public class CostServiceImpl implements CostService {

    @Resource
    private CostMapper costMapper;


    @Override
    public int insert(Cost record) {
        return costMapper.insert(record);
    }


    @Override
    public List<Cost> findAll() {
        return costMapper.findAll();
    }

    @Override
    public PageBean<Cost> Order(String rankBaseD, String rankBaseC, PageBean<Cost> pageBean) {

        getStart(pageBean);

        List<String> params = new ArrayList<>();
        params.add(rankBaseD);
        params.add(rankBaseC);

//        List<Cost> costList = costMapper.orderByBaseDuration(params);
//
//        pageBean.setBeanList(costList);

        return pageBean;
    }


    @Override
    public void updateStatus(Cost cost) {

        Integer status = cost.getStatus();
        if (status == 1){
            cost.setStatus(0);
        }else {
            cost.setStatus(1);
        }
        costMapper.updateStatus(cost);
    }

    @Override
    public Cost findById(Integer costId) {
        return costMapper.findById(costId);
    }

    @Override
    public void update(Cost cost) {
        costMapper.update(cost);
    }

    @Override
    public void deleteById(Integer costId) {
        costMapper.deleteById(costId);
    }

    @Override
    public PageBean<Cost> findAll(PageBean<Cost> pageBean) {

        getStart(pageBean);

        List<Cost> costList = costMapper.findAll1(pageBean);

        pageBean.setBeanList(costList);

        return pageBean;
    }

    private void getStart(PageBean<Cost> pageBean) {
        int pc = pageBean.getPc();
        int ps = pageBean.getPs();
        pageBean.setStart((pc -1)*ps);

        pageBean.setTr(costMapper.findAll().size());
    }


}
