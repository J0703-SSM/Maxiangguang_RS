package com.baidu.admin.service.impl;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.domain.domain_ext.AdminExt;
import com.baidu.admin.domain.domain_ext.PageBeanExt;
import com.baidu.admin.mapper.AdminMapper;
import com.baidu.admin.service.AdminService;
import com.baidu.base.domain.PageBean;
import com.baidu.privilege.domain.Privilege;
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
        List<Admin> adminList = adminMapper.findByNameAndPwd(admin);

        for (Admin ad : adminList) {
            System.out.println(ad);
        }
        return adminList!= null && adminList.size()>0?adminList.get(0):null;
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

    @Override
    public void update(Admin admin) {
        adminMapper.update(admin);
    }

    @Override
    public void insertAdmin(Admin admin) {
        adminMapper.insertAdmin(admin);
    }

    @Override
    public void insertAdminAndRole(AdminExt adminExt) {
        adminMapper.insertAdminAndRole(adminExt);
    }

    @Override
    public Admin findByAdminCode(Admin admin) {
        return adminMapper.findByAdminCode(admin);
    }

    @Override
    public Admin findByEmail(Admin admin) {
        return adminMapper.findByEmail(admin);
    }

    @Override
    public Admin findByTel(Admin admin) {
        return adminMapper.findByTel(admin);
    }

    @Override
    public Admin findByAdminId(Admin admin) {
        return adminMapper.findByAdminId(admin);
    }

    @Override
    public int delete(Admin admin) {
         return adminMapper.delete(admin);
    }

    @Override
    public void deleteAdminAndRole(Admin admin) {
        adminMapper.deleteAdminAndRole(admin);
    }

    @Override
    public PageBeanExt findByRoleAndPrivilege(PageBeanExt pageBean) {

        int pc = pageBean.getPc();
        int ps = pageBean.getPs();
        pageBean.setStart((pc -1)*ps);

        pageBean.setTr(adminMapper.findAllByPrivilegeAndRole(pageBean).size());

        List<Admin> adminList = adminMapper.findAllByPrivilegeAndRole(pageBean);

        pageBean.setBeanList(adminList);

        return pageBean;
    }

    private void getStart(PageBean<Admin> pageBean) {
        int pc = pageBean.getPc();
        int ps = pageBean.getPs();
        pageBean.setStart((pc -1)*ps);

        pageBean.setTr(adminMapper.findAll().size());
    }
}
