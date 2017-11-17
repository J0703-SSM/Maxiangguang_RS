package com.baidu.privilege.domain;

/**
 * Created by dllo on 17/11/14.
 */
public class Privilege {
    private int privilegeId;
    private String privilegeName;


    public Privilege() {
    }

    public Privilege(String privilegeName) {
        this.privilegeName = privilegeName;
    }

    public Privilege(int privilegeId, String privilegeName) {
        this.privilegeId = privilegeId;
        this.privilegeName = privilegeName;
    }

    @Override
    public String toString() {
        return "Privilege{" +
                "privilegeId=" + privilegeId +
                ", privilegeName='" + privilegeName + '\'' +
                '}';
    }

    public int getPrivilegeId() {
        return privilegeId;
    }

    public void setPrivilegeId(int privilegeId) {
        this.privilegeId = privilegeId;
    }

    public String getPrivilegeName() {
        return privilegeName;
    }

    public void setPrivilegeName(String privilegeName) {
        this.privilegeName = privilegeName;
    }
}
