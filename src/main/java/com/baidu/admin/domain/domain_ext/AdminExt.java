package com.baidu.admin.domain.domain_ext;

import com.baidu.admin.domain.Admin;

import java.util.Map;

/**
 * Created by dllo on 17/11/14.
 */
public class AdminExt extends Admin {

    private Map<Integer, String> roles;
    private Map<Integer, String> privileges;

    @Override
    public String toString() {
        return "AdminExt{" +
                "roles=" + roles +
                ", privileges=" + privileges +
                "} " + super.toString();
    }

    public Map<Integer, String> getRoles() {
        return roles;
    }

    public void setRoles(Map<Integer, String> roles) {
        this.roles = roles;
    }

    public Map<Integer, String> getPrivileges() {
        return privileges;
    }

    public void setPrivileges(Map<Integer, String> privileges) {
        this.privileges = privileges;
    }
}
