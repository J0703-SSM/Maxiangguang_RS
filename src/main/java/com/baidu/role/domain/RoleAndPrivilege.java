package com.baidu.role.domain;

/**
 * Created by dllo on 17/11/15.
 */
public class RoleAndPrivilege {

    private int roleId;
    private int privilegeId;

    public RoleAndPrivilege() {
    }

    public RoleAndPrivilege(int roleId, int privilegeId) {
        this.roleId = roleId;
        this.privilegeId = privilegeId;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }

    public int getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(int privilegeId) {
        this.privilegeId = privilegeId;
    }
}
