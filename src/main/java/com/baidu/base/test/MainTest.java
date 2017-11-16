package com.baidu.base.test;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.mapper.AdminMapper;
import com.baidu.base.domain.PageBean;
import com.baidu.cost.domain.Cost;
import com.baidu.cost.mapper.CostMapper;
import com.baidu.role.domain.Role;
import com.baidu.role.mapper.RoleMapper;
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
        context = new ClassPathXmlApplicationContext("/spring/spring-*.xml");

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
    @Test
    public void testFindRole(){
        RoleMapper roleMapper = (RoleMapper) context.getBean("roleMapper");
//        List<Role> all = roleMapper.findAll();
//        for (Role role : all) {
//            System.out.println(role);
//        }

        Role byId = roleMapper.findByName("123");
        System.out.println(byId);
    }


    @Test
    public void testFindAdmin(){
        AdminMapper adminMapper = (AdminMapper) context.getBean("adminMapper");
        Admin admin = new Admin();
        admin.setAdminCode("11");
        admin.setPassword("111");
        Admin admin1 = adminMapper.findByNameAndPwd(admin);
        System.out.println(admin1);
    }




}
