package com.baidu.admin.domain.domain_ext;

import com.baidu.admin.domain.Admin;
import com.baidu.role.domain.Role;

import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
public class AdminExt extends Admin {

    private int roleId;
    private int privilegeId;
    private String role;
    private List<String> roles;
    private String privilege;
    private List<String> privileges;
    private List<Role> roleList;

    @Override
    public String toString() {
        return "AdminExt{" +
                "roleId=" + roleId +
                ", privilegeId=" + privilegeId +
                ", role='" + role + '\'' +
                ", roles=" + roles +
                ", privilege='" + privilege + '\'' +
                ", privileges=" + privileges +
                "} " + super.toString();
    }


    public int getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(int privilegeId) {
        this.privilegeId = privilegeId;
    }

    @Override
    public String getRole() {
        return role;
    }

    @Override
    public void setRole(String role) {
        this.role = role;
    }

    public List<String> getRoles() {
        return roles;
    }

    public void setRoles(List<String> roles) {
        this.roles = roles;
    }

    public String getPrivilege() {
        return privilege;
    }

    public void setPrivilege(String privilege) {
        this.privilege = privilege;
    }

    public List<String> getPrivileges() {
        return privileges;
    }

    public void setPrivileges(List<String> privileges) {
        this.privileges = privileges;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
