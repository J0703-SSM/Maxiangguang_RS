package com.baidu.role.service.impl;

import com.baidu.base.domain.PageBean;
import com.baidu.role.domain.Role;
import com.baidu.role.domain.RoleAndPrivilege;
import com.baidu.role.mapper.RoleMapper;
import com.baidu.role.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
@Service("roleService")
public class RoleServiceImpl implements RoleService {

    @Qualifier("roleMapper")
    @Autowired
    private RoleMapper roleMapper;

    @Override
    public List<Role> findAll() {
        return roleMapper.findAll();
    }

    @Override
    public PageBean<Role> findAll(PageBean<Role> pageBean) {
        // 计算起始页
        getStart(pageBean);

        List<Role> roleList = roleMapper.findAll1(pageBean);
        pageBean.setBeanList(roleList);

        return pageBean;
    }

    @Override
    public Role findByName(String roleName) {
        return roleMapper.findByName(roleName);
    }

    @Override
    public void insert(Role role) {
        roleMapper.insert(role);
    }

    @Override
    public void insertRoleAndPrivilege(RoleAndPrivilege rp) {
        roleMapper.insertRoleAndPrivilege(rp);
    }

    @Override
    public Role findById(int roleId) {
        return roleMapper.findById(roleId);
    }

    @Override
    public void update(Role role) {
        roleMapper.update(role);
    }

    @Override
    public void deleteRoleAndPrivilege(int roleId) {
        roleMapper.deleteRoleAndPrivilegeByRoleId(roleId);
    }

    @Override
    public void deleteById(int roleId) {
        roleMapper.deleteById(roleId);
    }


    private void getStart(PageBean<Role> pageBean) {
        int pc = pageBean.getPc();
        int ps = pageBean.getPs();
        pageBean.setStart((pc - 1)*ps);
        pageBean.setTr(roleMapper.findAll().size());
    }
}
