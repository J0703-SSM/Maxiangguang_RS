package com.baidu.admin.service;


import com.baidu.admin.domain.Admin;
import com.baidu.admin.domain.domain_ext.AdminExt;
import com.baidu.base.domain.PageBean;

/**
 * Created by dllo on 17/11/14.
 */
public interface AdminService {

    Admin findByNameAndPsw(Admin admin);


    PageBean<Admin> findAll(PageBean<Admin> pageBean);

    /**
     * 跟新密码
     * @param admin1
     */
    void updatePwd(Admin admin1);

    /**
     * 跟新内容
     * @param admin
     */
    void update(Admin admin);

    /**
     * 插入数据
     * @param admin
     */
    void insertAdmin(Admin admin);

    void insertAdminAndRole(AdminExt adminExt);

    Admin findByAdminCode(Admin admin);

    Admin findByEmail(Admin admin);

    Admin findByTel(Admin admin);

    Admin findByAdminId(Admin admin);

    int delete(Admin admin);
}
