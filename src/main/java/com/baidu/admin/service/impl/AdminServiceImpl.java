package com.baidu.admin.service.impl;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.mapper.AdminMapper;
import com.baidu.admin.service.AdminService;
import com.baidu.base.domain.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    @Override
    public PageBean<Admin> findAll(PageBean<Admin> pageBean) {

        getStart(pageBean);

        List<Admin> adminList = adminMapper.findAll1(pageBean);

        pageBean.setBeanList(adminList);

        return pageBean;
    }

    @Override
    public void updatePwd(Admin admin1) {
        adminMapper.updatePwd(admin1);
    }

    private void getStart(PageBean<Admin> pageBean) {
        int pc = pageBean.getPc();
        int ps = pageBean.getPs();
        pageBean.setStart((pc -1)*ps);

        pageBean.setTr(adminMapper.findAll().size());
    }
}
