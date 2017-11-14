package com.baidu.admin.service;


import com.baidu.admin.domain.Admin;

/**
 * Created by dllo on 17/11/14.
 */
public interface AdminService {

    Admin findByNameAndPsw(Admin admin);


}
