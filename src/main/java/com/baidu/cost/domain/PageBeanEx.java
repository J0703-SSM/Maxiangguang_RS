package com.baidu.cost.domain;

import com.baidu.base.domain.PageBean;

import java.util.List;

/**
 * Created by dllo on 17/11/21.
 */
public class PageBeanEx extends PageBean<Cost> {

    private String orderByCost;
    private String orderByDuration;


    @Override
    public String toString() {
        return "PageBeanEx{" +
                "orderByCost='" + orderByCost + '\'' +
                ", orderByDuration='" + orderByDuration + '\'' +
                "} " + super.toString();
    }

    public String getOrderByCost() {
        return orderByCost;
    }

    public void setOrderByCost(String orderByCost) {
        this.orderByCost = orderByCost;
    }

    public String getOrderByDuration() {
        return orderByDuration;
    }

    public void setOrderByDuration(String orderByDuration) {
        this.orderByDuration = orderByDuration;
    }
}
