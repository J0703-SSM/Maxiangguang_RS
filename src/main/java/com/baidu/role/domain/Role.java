package com.baidu.role.domain;

import com.baidu.privilege.domain.Privilege;
import org.hibernate.validator.constraints.NotBlank;

import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
public class Role  {
    private int roleId;
    @NotBlank(message = "角色名不能为空")
    private String roleName;
    @NotBlank(message = "至少选一个")
    private String privilege;

    private List<Privilege> privilegeList;

    public Role() {
    }

    public Role(String roleName) {
        this.roleName = roleName;
    }

    public Role(int roleId, String roleName) {
        this.roleId = roleId;
        this.roleName = roleName;
    }

    public Role(int roleId, String roleName, String privilege) {
        this.roleId = roleId;
        this.roleName = roleName;
        this.privilege = privilege;
    }

    @Override
    public String toString() {
        return "Role{" +
                "roleId=" + roleId +
                ", roleName='" + roleName + '\'' +
                ", privilege='" + privilege + '\'' +
                '}';
    }

    public List<Privilege> getPrivilegeList() {
        return privilegeList;
    }

    public void setPrivilegeList(List<Privilege> privilegeList) {
        this.privilegeList = privilegeList;
    }

    public String getPrivilege() {
        return privilege;
    }

    public void setPrivilege(String privilege) {
        this.privilege = privilege;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public int getRoleId() {
        return roleId;
    }

    public void setRoleId(int roleId) {
        this.roleId = roleId;
    }
}
