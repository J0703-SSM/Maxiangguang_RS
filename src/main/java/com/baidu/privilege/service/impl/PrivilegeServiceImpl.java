package com.baidu.privilege.service.impl;

import com.baidu.privilege.domain.Privilege;
import com.baidu.privilege.mapper.PrivilegeMapper;
import com.baidu.privilege.service.PrivilegeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
@Service("privilegeService")
public class PrivilegeServiceImpl implements PrivilegeService {

    @Resource
    private PrivilegeMapper privilegeMapper;

    @Override
    public List<Privilege> findAll() {
        return privilegeMapper.findAll();
    }

    @Override
    public Privilege findByName(String s) {
        return privilegeMapper.findByName(s);
    }
}
