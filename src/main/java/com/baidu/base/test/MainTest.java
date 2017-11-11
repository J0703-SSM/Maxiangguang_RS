package com.baidu.base.test;

import com.baidu.cost.domain.Cost;
import com.baidu.cost.mapper.CostMapper;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

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

        Cost cost = costMapper.selectByPrimaryKey(1);

        System.out.println(cost);
    }

}
