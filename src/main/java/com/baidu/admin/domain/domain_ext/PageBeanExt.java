package com.baidu.admin.domain.domain_ext;

import com.baidu.admin.domain.Admin;
import com.baidu.base.domain.PageBean;

import java.util.List;

/**
 * Created by dllo on 17/11/17.
 */
public class PageBeanExt extends PageBean<Admin> {

    private int privilegeId;
    private List<String> roles;

    @Override
    public String toString() {
        return "PageBeanExt{" +
                "privilegeId=" + privilegeId +
                ", roles=" + roles +
                "} " + super.toString();
    }

    public int getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(int privilegeId) {
        this.privilegeId = privilegeId;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }
}
