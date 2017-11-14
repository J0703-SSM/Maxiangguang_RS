package com.baidu.privilege.mapper;

import com.baidu.privilege.domain.Privilege;

import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
public interface PrivilegeMapper {

    List<Privilege> findAll();

}
