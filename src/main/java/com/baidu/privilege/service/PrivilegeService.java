package com.baidu.privilege.service;

import com.baidu.privilege.domain.Privilege;

import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
public interface PrivilegeService {

    List<Privilege> findAll();
}
