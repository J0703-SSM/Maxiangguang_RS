package com.baidu.role.service;

import com.baidu.base.domain.PageBean;
import com.baidu.role.domain.Role;
import com.baidu.role.domain.RoleAndPrivilege;

import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
public interface RoleService {

    List<Role> findAll();

    PageBean<Role> findAll(PageBean<Role> pageBean);


    Role findByName(String roleName);

    void insert(Role role);

    void insertRoleAndPrivilege(RoleAndPrivilege rp);

    Role findById(int roleId);

    void update(Role role);

    void deleteRoleAndPrivilege(int roleId);

    void deleteById(int roleId);
}
