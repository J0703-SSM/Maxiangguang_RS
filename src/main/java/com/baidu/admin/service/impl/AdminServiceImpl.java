package com.baidu.admin.service.impl;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.mapper.AdminMapper;
import com.baidu.admin.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by dllo on 17/11/14.
 */
@Service("adminService")
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Override
    public Admin findByNameAndPsw(Admin admin) {
        return adminMapper.findByNameAndPwd(admin);
    }
}
