package com.baidu.admin.domain;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * Created by dllo on 17/11/13.
 */
public class Admin {

    private int adminId;
    @NotBlank(message = "不能为空")
    @Size(min = 3, max = 20, message = "3 ~ 20 位之间")
    private String adminCode;//工号
    @NotBlank(message = "不能为空")
    @Size(min = 3, max = 20, message = "3 ~ 20 位之间")
    private String password;
    @NotBlank(message = "不能为空")
    private String name;
    @NotBlank(message = "不能为空")
    @Pattern(regexp = "^(1[3|5|7|8][0-9])\\d{8}$", message = "电话号码格式错误")
    private String telephone;
    @NotBlank(message = "不能为空")
    @Email(regexp = "^\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*$", message = "邮箱格式错误")
    private String email;
    private Date enrolldate;
    private String role;//角色
    private String code;//验证码

    @NotBlank(message = "不能为空")
    @Size(max = 30, message = "30长度以内的字母、数字和下划线的组合")
    private String newPassword;
    @NotBlank(message = "不能为空")
    @Size(max = 30, message = "30长度以内的字母、数字和下划线的组合")
    private String reNewPassword;

    public Admin() {
    }

    public Admin(String adminCode, String password, String name, String telephone, String email, Date enrolldate, String role, String code, String newPassword, String reNewPassword) {
        this.adminCode = adminCode;
        this.password = password;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.enrolldate = enrolldate;
        this.role = role;
        this.code = code;
        this.newPassword = newPassword;
        this.reNewPassword = reNewPassword;
    }

    public Admin(int adminId, String adminCode, String password, String name, String telephone, String email, Date enrolldate, String role, String code, String newPassword, String reNewPassword) {
        this.adminId = adminId;
        this.adminCode = adminCode;
        this.password = password;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.enrolldate = enrolldate;
        this.role = role;
        this.code = code;
        this.newPassword = newPassword;
        this.reNewPassword = reNewPassword;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminCode='" + adminCode + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", enrolldate=" + enrolldate +
                ", role='" + role + '\'' +
                ", code='" + code + '\'' +
                ", newPassword='" + newPassword + '\'' +
                ", reNewPassword='" + reNewPassword + '\'' +
                '}';
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getReNewPassword() {
        return reNewPassword;
    }

    public void setReNewPassword(String reNewPassword) {
        this.reNewPassword = reNewPassword;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminCode() {
        return adminCode;
    }

    public void setAdminCode(String adminCode) {
        this.adminCode = adminCode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getEnrolldate() {
        return enrolldate;
    }

    public void setEnrolldate(Date enrolldate) {
        this.enrolldate = enrolldate;
    }
}
