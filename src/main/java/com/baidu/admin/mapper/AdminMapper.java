package com.baidu.admin.mapper;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.domain.domain_ext.AdminExt;
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

    void update(Admin admin);

    void insertAdmin(Admin admin);

    void insertAdminAndRole(AdminExt adminExt);

    Admin findByAdminCode(Admin admin);

    Admin findByEmail(Admin admin);

    Admin findByTel(Admin admin);

    Admin findByAdminId(Admin admin);

    int delete(Admin admin);
}
