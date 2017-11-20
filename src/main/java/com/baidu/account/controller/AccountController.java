package com.baidu.account.controller;

import com.baidu.account.domain.Account;
import com.baidu.account.service.AccountService;
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

    /**
     * 添加 account 对象
     * @return
     */
    @RequestMapping("/account_add")
    public String accountAdd(@Validated Account account, BindingResult bindingResult,
                                      Model model){

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


        return "account/account_add";
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

        return "account_update";
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
    @ResponseBody
    @RequestMapping("account_delete")
    public Result accountDelete(Account account){


        Result result = new Result();
        result.setSuccess(true);

        return result;
    }


}
