package com.baidu.admin.domain.domain_ext;

import com.baidu.admin.domain.Admin;

import java.util.Map;

/**
 * Created by dllo on 17/11/14.
 */
public class AdminExt extends Admin {

    private String roles;
    private String privilege;

    @Override
    public String toString() {
        return "AdminExt{" +
                "roles='" + roles + '\'' +
                ", privilege='" + privilege + '\'' +
                "} " + super.toString();
    }

    public String getRoles() {
        return roles;
    }

    public void setRoles(String roles) {
        this.roles = roles;
    }

    public String getPrivilege() {
        return privilege;
    }

    public void setPrivilege(String privilege) {
        this.privilege = privilege;
    }
}
