package com.baidu.account.controller;

import com.baidu.account.domain.Account;
import com.baidu.account.service.AccountService;
import com.baidu.admin.domain.Admin;
import com.baidu.base.domain.PageBean;
import com.baidu.base.utils.Result;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.Date;

/**
 * Created by dllo on 17/11/15.
 */
@Controller
@RequestMapping("/account")
public class AccountController {

    @Resource
    private AccountService accountService;

    @RequestMapping("/account_list")
    public String accountList(PageBean<Account> pageBean, Model model) {

        getPageProperties(pageBean);

        pageBean =  accountService.findAll(pageBean);

        System.out.println(pageBean.getBeanList());

        model.addAttribute("pageBean",pageBean);

        return "account/account_list";
    }

    /**
     * 设置pageBean的参数
     *
     * @param pageBean
     */
    private void getPageProperties(PageBean<Account> pageBean) {
        int pc = pageBean.getPc();
        // 如果pc小于等于0, 令其等于1
        if (pc <= 0) {
            pageBean.setPc(1);
        }
        // 显示五条
        pageBean.setPs(5);

        // 设置url, 用于点击页面查询
        pageBean.setUrl("/account/account_list");
    }

    /**
     *  显示详情
     * @param account
     * @param model
     * @return
     */
    @RequestMapping("/account_detail")
    public String accountDetail(Account account, Model model){

        account = accountService.findById(account.getAccountId());

        model.addAttribute("account", account);

        return "account/account_detail";
    }

    /**
     * 添加前页面跳转
     * @return
     */
    @RequestMapping("/account_addPrep")
    public String accountAddPrep(){
        return "account/account_add";
    }

    @ResponseBody
    @RequestMapping("/getBirthDate")
    public String getBirthDate(Account account){

        if (null ==account){
            return "";
        }
        String idcardNo = account.getIdcardNo();
        StringBuilder sb = new StringBuilder();
        sb.append(idcardNo.substring(6,10)).append("-");
        sb.append(idcardNo.substring(10,12)).append("-");
        sb.append(idcardNo.substring(12,14));

        System.out.println(sb.toString());

        return sb.toString();
    }


    /**
     * 添加 account 对象
     * @return
     */
    @RequestMapping("/account_add")
    public String accountAdd(@Validated Account account, BindingResult bindingResult,
                             PageBean<Account> pageBean, Model model){

        model.addAttribute("account", account);
        if(bindingResult.hasErrors()){
            FieldError realNameEr = bindingResult.getFieldError("realName");
            FieldError idcardNoEr = bindingResult.getFieldError("idcardNo");
            FieldError loginNameEr = bindingResult.getFieldError("loginName");
            FieldError passwordEr = bindingResult.getFieldError("password");
            FieldError rePasswordEr = bindingResult.getFieldError("rePassword");
            FieldError telephoneEr = bindingResult.getFieldError("telephone");

            model.addAttribute("realNameEr",realNameEr);
            model.addAttribute("idcardNoEr",idcardNoEr);
            model.addAttribute("loginNameEr",loginNameEr);
            model.addAttribute("passwordEr",passwordEr);
            model.addAttribute("rePasswordEr",rePasswordEr);
            model.addAttribute("telephoneEr",telephoneEr);

            if (realNameEr != null || idcardNoEr != null || null != loginNameEr
                    || null != passwordEr || rePasswordEr != null || null != telephoneEr){
                return "account/account_add";
            }
        }

        if (!account.getLoginPasswd().equals(account.getRePassWord())){
            model.addAttribute("error", "两次密码不一致");
            return "account/account_add";
        }
        if (null != account.getRecommenderIdCard()||!"".equals(account.getRecommenderIdCard())){
            model.addAttribute("recommenderIdEr", "请输入正确的身份证号码");
            return "account/account_add";
        }
        if (null != account.getEmail()||!"".equals(account.getEmail())){
            String email = account.getEmail();
            if (!email.matches(Admin.REGEX_EMAIL)) {
                model.addAttribute("emailEr", "邮箱格式错误");
            }
        }
        if (null != account.getMailAddress()||!"".equals(account.getMailAddress())){
            String mailAddress = account.getMailAddress();
            if (!mailAddress.matches("\\w{1,50}")){
                model.addAttribute("mailAddressEr", "必须在50以内");
            }
        }
        if (null != account.getZipCode()|| !"".equals(account.getZipCode())){
            String zipCode = account.getZipCode();
            if (!zipCode.matches("\\d{6}")) {
                model.addAttribute("zipCodeEr","6位邮编");
            }
        }
        if (null != account.getQq()|| !"".equals(account.getQq())){
            String qq = account.getQq();
            if (!qq.matches("\\d{5,13}")) {
                model.addAttribute("qqEr","5 - 13 位qq号");
            }
        }

        account.setStatus("1");
        account.setCreateDate(new Date());

        accountService.insertAccount(account);

        getPageProperties(pageBean);
        accountService.findAll(pageBean);

        return "account/account_list";
    }

    /**
     * 跟新页面跳转
     * @param account
     * @param model
     * @return
     */
    @RequestMapping("account_updatePrep")
    public String accountUpdatePrep(Account account, Model model){

        account = accountService.findById(account.getAccountId());

        model.addAttribute("account", account);

        return "account/account_modi";
    }

    /**
     *  跟新
     * @param account
     * @param model
     * @return
     */
    @RequestMapping("account_update")
    public String accountUpdate(@Validated Account account, Model model){

        return "account/account_modi";
    }

    /**
     * 删除
     * @param account
     * @return
     */
    @RequestMapping("account_delete")
    public void accountDelete(Account account){


        accountService.deleteById(account.getAccountId());

    }


}
