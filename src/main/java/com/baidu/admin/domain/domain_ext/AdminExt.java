package com.baidu.admin.domain.domain_ext;

import com.baidu.admin.domain.Admin;

import java.util.Map;

/**
 * Created by dllo on 17/11/14.
 */
public class AdminExt extends Admin {

    private int roleId;

    @Override
    public String toString() {
        return "AdminExt{" +
                "rolesId=" + roleId +
                "} " + super.toString();
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
