package com.baidu.base.test;

import com.baidu.base.domain.PageBean;
import com.baidu.cost.domain.Cost;
import com.baidu.cost.mapper.CostMapper;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by dllo on 17/11/11.
 */
public class MainTest {

    private ApplicationContext context;

    @Before
    public void init(){
        // 获得启动容器
        context = new ClassPathXmlApplicationContext("spring-config.xml");

    }

    @Test
    public void testDao(){
        CostMapper costMapper = (CostMapper) context.getBean("costMapper");

        List<Cost> costs = costMapper.findAll();

        for (Cost cost : costs) {
            System.out.println(cost);
        }
    }

    @Test
    public void testFindAll1(){
        CostMapper costMapper = (CostMapper) context.getBean("costMapper");

        PageBean<Cost> pageBean = new PageBean<>();
        pageBean.setPs(5);
        pageBean.setPc(1);

        List<Cost> all1 = costMapper.findAll1(pageBean);
        System.out.println(all1);
    }

    @Test
    public void testOrder(){
        CostMapper costMapper = (CostMapper) context.getBean("costMapper");

        List<String> p= new ArrayList<>();
        p.add("desc");
        p.add("asc");

        List<Cost> costList = costMapper.orderByBaseDuration("desc","asc");

        for (Cost cost : costList) {
            System.out.println(cost);
        }

    }


}
