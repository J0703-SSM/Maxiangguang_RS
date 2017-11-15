package com.baidu.admin.service;


import com.baidu.admin.domain.Admin;
import com.baidu.base.domain.PageBean;

/**
 * Created by dllo on 17/11/14.
 */
public interface AdminService {

    Admin findByNameAndPsw(Admin admin);


    PageBean<Admin> findAll(PageBean<Admin> pageBean);

    void updatePwd(Admin admin1);
}
