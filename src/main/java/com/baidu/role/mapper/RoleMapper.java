package com.baidu.role.mapper;

import com.baidu.base.domain.PageBean;
import com.baidu.role.domain.Role;
import com.baidu.role.domain.RoleAndPrivilege;

import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
public interface RoleMapper {


    List<Role> findAll();

    List<Role> findAll1(PageBean<Role> pageBean);

    Role findByName(String roleName);

    void insert(Role role);

    void insertRoleAndPrivilege(RoleAndPrivilege rp);

    Role findById(int roleId);

    void update(Role role);

    RoleAndPrivilege findRoleAndPrivilege(RoleAndPrivilege rp);

    List<RoleAndPrivilege> findRoleAndPrivilegeByRoleId(int roleId);

    void deleteRoleAndPrivilegeByRoleId(int roleId);

    void deleteById(int roleId);
}
