package com.baidu.admin.domain;

import org.hibernate.validator.constraints.NotBlank;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

/**
 * Created by dllo on 17/11/13.
 */
public class Admin {

    private int adminId;
    @NotNull(message = "not null")
    private String adminCode;
    @NotNull(message = "not null")
    private String password;
    private String code;
    private String name;
    private String telephone;
    private String email;
    private Date enrolldate;

    public Admin() {
    }

    public Admin(String adminCode, String password) {
        this.adminCode = adminCode;
        this.password = password;
    }

    public Admin(String adminCode, String password, String code) {
        this.adminCode = adminCode;
        this.password = password;
        this.code = code;
    }

    public Admin(String adminCode, String password, String name, String telephone, String email, Date enrolldate) {
        this.adminCode = adminCode;
        this.password = password;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.enrolldate = enrolldate;
    }

    public Admin(String adminCode, String password, String code, String name, String telephone, String email, Date enrolldate) {
        this.adminCode = adminCode;
        this.password = password;
        this.code = code;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.enrolldate = enrolldate;
    }

    public Admin(int adminId, String adminCode, String password, String name, String telephone, String email, Date enrolldate) {
        this.adminId = adminId;
        this.adminCode = adminCode;
        this.password = password;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.enrolldate = enrolldate;
    }

    public Admin(int adminId, String adminCode, String password, String code, String name, String telephone, String email, Date enrolldate) {
        this.adminId = adminId;
        this.adminCode = adminCode;
        this.password = password;
        this.code = code;
        this.name = name;
        this.telephone = telephone;
        this.email = email;
        this.enrolldate = enrolldate;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminCode='" + adminCode + '\'' +
                ", password='" + password + '\'' +
                ", code='" + code + '\'' +
                ", name='" + name + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", enrolldate=" + enrolldate +
                '}';
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
