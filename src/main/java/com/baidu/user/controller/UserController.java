package com.baidu.user.controller;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by dllo on 17/11/15.
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Resource
    private AdminService adminService;

    /**
     * 回显
     */
    @RequestMapping("/user_info")
    public String userInfo(HttpSession session, Model model) {

        Admin admin = (Admin) session.getAttribute("admin");

        System.out.println(admin);

        model.addAttribute("admin", admin);

        return "user/user_info";
    }

    /**
     * 修改信息
     */
    @RequestMapping("/user_update")
    public String userUpdate(@Validated Admin admin, BindingResult br,
                             Model model, HttpSession session) {

        System.out.println(admin);

        // 判断是否有错误信息
        if (br.hasErrors()) {
            FieldError nameEr = br.getFieldError("name");
            FieldError telephoneEr = br.getFieldError("telephone");
            FieldError emailEr = br.getFieldError("email");

            model.addAttribute("nameEr", nameEr);
            model.addAttribute("telephoneEr", telephoneEr);
            model.addAttribute("emailEr", emailEr);

            model.addAttribute("admin", admin);

            if (nameEr != null || telephoneEr != null || emailEr != null) {
                return "user/user_info";
            }
        }

        // 修改
        adminService.update(admin);


        return "user/user_info";
    }

    /**
     * 页面跳转
     */
    @RequestMapping("/user_modi_pwd")
    public String user_modi_pwd() {

        return "user/user_modi_pwd";
    }

    /**
     * 修改密码
     */
    @RequestMapping("/user_update_pwd")
    public String updatePwd(@Validated Admin admin, BindingResult result,
                            HttpServletRequest request, Model model) {

        // 用于表单回显
        model.addAttribute("oldPwd", admin.getPassword());
        model.addAttribute("newPwd", admin.getNewPassword());

        // 输入验证
        if (result.hasErrors()) {
            FieldError password = result.getFieldError("password");
            if (password != null) {
                String passwordEr = password.getDefaultMessage();
                model.addAttribute("passwordEr", passwordEr);
            }
            FieldError newPassword = result.getFieldError("newPassword");
            if (newPassword != null) {
                String newPasswordEr = newPassword.getDefaultMessage();
                model.addAttribute("newPasswordEr", newPasswordEr);
            }
            FieldError reNewPassword = result.getFieldError("reNewPassword");
            if (reNewPassword != null) {
                String reNewPasswordEr = reNewPassword.getDefaultMessage();
                model.addAttribute("reNewPasswordEr", reNewPasswordEr);
            }

            if (null != password || null != newPassword || null != reNewPassword) {
                return "user/user_modi_pwd";
            }

        }

        Admin admin1 = (Admin) request.getServletContext().getAttribute("admin");
        String oldPwd = admin1.getPassword();

        /*
            旧密码验证
         */
        if (!oldPwd.equals(admin.getPassword())) {
            model.addAttribute("passwordEr", "旧密码不正确, 请重新输入");
            return "user/user_modi_pwd";
        }
        if(oldPwd.equals(admin.getNewPassword())){
            model.addAttribute("passwordEr","新密码不能与旧密码相同");
            return "user/user_modi_pwd";
        }
        // 两次新密码验证
        if (!admin.getReNewPassword().equals(admin.getNewPassword())) {
            model.addAttribute("reNewPasswordEr", "两次密码输入不一致, 请重新输入");

            return "user/user_modi_pwd";
        }

        // 设置新密码
        admin1.setPassword(admin.getNewPassword());

        // 更新
        adminService.updatePwd(admin1);

        request.getServletContext().removeAttribute("admin");

        return "login";
    }

}
