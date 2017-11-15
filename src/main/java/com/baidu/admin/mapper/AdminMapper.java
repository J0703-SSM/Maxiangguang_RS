package com.baidu.admin.mapper;

import com.baidu.admin.domain.Admin;
import com.baidu.base.domain.PageBean;

import java.util.List;

/**
 * Created by dllo on 17/11/13.
 */
public interface AdminMapper {

    Admin findByNameAndPwd(Admin admin);


    List<Admin> findAll();

    List<Admin> findAll1(PageBean<Admin> pageBean);

    void updatePwd(Admin admin1);

}
