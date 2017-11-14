package com.baidu.role.mapper;

import com.baidu.base.domain.PageBean;
import com.baidu.role.domain.Role;

import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
public interface RoleMapper {


    List<Role> findAll();

    List<Role> findAll1(PageBean<Role> pageBean);

    Role findByName(String roleName);
}
