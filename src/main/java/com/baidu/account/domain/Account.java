package com.baidu.account.domain;

import com.baidu.admin.domain.Admin;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.sql.*;
import java.util.Date;

/**
 * Created by dllo on 17/11/19.
 */
public class Account {

    private static final String REGEX_IDCARD = "(^[1-9]\\d{5}\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{2}$)||(^[1-9]\\d{5}(18|19|([23]\\d))\\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\\d{3}[0-9Xx]$)";

    private int accountId;

    private int recommenderId;
    @Pattern(regexp = REGEX_IDCARD, message = "身份证号码格式错误")
    private String recommenderIdCard;
    @Size(min = 3, max = 20, message = "3 ~ 20 位之间")
    private String loginName;
    @Size(min = 3, max = 20, message = "3 ~ 20 位之间")
    private String loginPasswd;
    @NotBlank(message = "不能为空")
    private String rePassWord;

    private String status;

    private Date createDate;

    private Timestamp pauseDate;

    private Timestamp closeDate;

    private String realName;
    @Pattern(regexp = REGEX_IDCARD, message = "身份证号码格式错误")
    private String idcardNo;

    private String birthDate;

    private String gender;
    private String occupation;
    @Pattern(regexp = Admin.REGEX_MOBILE, message = "电话号码格式错误")
    private String telephone;

    private String email;

    private String mailAddress;

    private String zipCode;

    private String qq;

    private Timestamp lastLoginTime;

    private String lastLoginIp;

    public Account() {
    }

    public Account(int recommenderId, String recommenderIdCard, String loginName, String loginPasswd, String rePassWord, String status, Date createDate, Timestamp pauseDate, Timestamp closeDate, String realName, String idcardNo, String birthDate, String gender, String occupation, String telephone, String email, String mailAddress, String zipCode, String qq, Timestamp lastLoginTime, String lastLoginIp) {
        this.recommenderId = recommenderId;
        this.recommenderIdCard = recommenderIdCard;
        this.loginName = loginName;
        this.loginPasswd = loginPasswd;
        this.rePassWord = rePassWord;
        this.status = status;
        this.createDate = createDate;
        this.pauseDate = pauseDate;
        this.closeDate = closeDate;
        this.realName = realName;
        this.idcardNo = idcardNo;
        this.birthDate = birthDate;
        this.gender = gender;
        this.occupation = occupation;
        this.telephone = telephone;
        this.email = email;
        this.mailAddress = mailAddress;
        this.zipCode = zipCode;
        this.qq = qq;
        this.lastLoginTime = lastLoginTime;
        this.lastLoginIp = lastLoginIp;
    }

    public Account(int accountId, int recommenderId, String recommenderIdCard, String loginName, String loginPasswd, String rePassWord, String status, Date createDate, Timestamp pauseDate, Timestamp closeDate, String realName, String idcardNo, String birthDate, String gender, String occupation, String telephone, String email, String mailAddress, String zipCode, String qq, Timestamp lastLoginTime, String lastLoginIp) {
        this.accountId = accountId;
        this.recommenderId = recommenderId;
        this.recommenderIdCard = recommenderIdCard;
        this.loginName = loginName;
        this.loginPasswd = loginPasswd;
        this.rePassWord = rePassWord;
        this.status = status;
        this.createDate = createDate;
        this.pauseDate = pauseDate;
        this.closeDate = closeDate;
        this.realName = realName;
        this.idcardNo = idcardNo;
        this.birthDate = birthDate;
        this.gender = gender;
        this.occupation = occupation;
        this.telephone = telephone;
        this.email = email;
        this.mailAddress = mailAddress;
        this.zipCode = zipCode;
        this.qq = qq;
        this.lastLoginTime = lastLoginTime;
        this.lastLoginIp = lastLoginIp;
    }

    @Override
    public String toString() {
        return "Account{" +
                "accountId=" + accountId +
                ", recommenderId=" + recommenderId +
                ", recommenderIdCard=" + recommenderIdCard +
                ", loginName='" + loginName + '\'' +
                ", loginPasswd='" + loginPasswd + '\'' +
                ", rePassWord='" + rePassWord + '\'' +
                ", status='" + status + '\'' +
                ", createDate=" + createDate +
                ", pauseDate=" + pauseDate +
                ", closeDate=" + closeDate +
                ", realName='" + realName + '\'' +
                ", idcardNo='" + idcardNo + '\'' +
                ", birthDate=" + birthDate +
                ", gender='" + gender + '\'' +
                ", occupation='" + occupation + '\'' +
                ", telephone='" + telephone + '\'' +
                ", email='" + email + '\'' +
                ", mailAddress='" + mailAddress + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", qq='" + qq + '\'' +
                ", lastLoginTime=" + lastLoginTime +
                ", lastLoginIp='" + lastLoginIp + '\'' +
                '}';
    }

    public String getRecommenderIdCard() {
        return recommenderIdCard;
    }

    public void setRecommenderIdCard(String recommenderIdCard) {
        this.recommenderIdCard = recommenderIdCard;
    }

    public String getRePassWord() {
        return rePassWord;
    }

    public void setRePassWord(String rePassWord) {
        this.rePassWord = rePassWord;
    }

    public void setCreateDate(Timestamp createDate) {
        this.createDate = createDate;
    }

    public void setPauseDate(Timestamp pauseDate) {
        this.pauseDate = pauseDate;
    }

    public void setCloseDate(Timestamp closeDate) {
        this.closeDate = closeDate;
    }

    public void setBirthDate(String birthDate) {
        this.birthDate = birthDate;
    }

    public void setLastLoginTime(Timestamp lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public int getAccountId() {
        return accountId;
    }

    public void setAccountId(int accountId) {
        this.accountId = accountId;
    }

    public int getRecommenderId() {
        return recommenderId;
    }

    public void setRecommenderId(int recommenderId) {
        this.recommenderId = recommenderId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginPasswd() {
        return loginPasswd;
    }

    public void setLoginPasswd(String loginPasswd) {
        this.loginPasswd = loginPasswd;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }


    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Timestamp getPauseDate() {
        return pauseDate;
    }

    public Timestamp getCloseDate() {
        return closeDate;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getIdcardNo() {
        return idcardNo;
    }

    public void setIdcardNo(String idcardNo) {
        this.idcardNo = idcardNo;
    }

    public String getBirthDate() {
        return birthDate;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getOccupation() {
        return occupation;
    }

    public void setOccupation(String occupation) {
        this.occupation = occupation;
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

    public String getMailAddress() {
        return mailAddress;
    }

    public void setMailAddress(String mailAddress) {
        this.mailAddress = mailAddress;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public Timestamp getLastLoginTime() {
        return lastLoginTime;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }
}
