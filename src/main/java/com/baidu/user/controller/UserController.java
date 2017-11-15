package com.baidu.user.controller;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.service.AdminService;
import com.baidu.base.utils.Result;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("/user_info")
    public String userInfo(HttpSession session, Model model) {

        Admin admin = (Admin) session.getAttribute("admin");

        System.out.println(admin);

        model.addAttribute("admin", admin);

        return "user/user_info";
    }

    @RequestMapping("/user_update")
    public String userUpdate(@Validated Admin admin, BindingResult br,
                             Model model, HttpSession session) {

        if (br.hasErrors()) {
            FieldError nameEr = br.getFieldError("name");
            FieldError telephoneEr = br.getFieldError("telephone");
            FieldError emailEr = br.getFieldError("email");

            model.addAttribute("nameEr", nameEr);
            model.addAttribute("telephoneEr", telephoneEr);
            model.addAttribute("emailEr", emailEr);
            model.addAttribute("admin", admin);

            return "user/user_info";
        }


        model.addAttribute("admin", admin);


        return "user/user_info";
    }

    @RequestMapping("/user_modi_pwd")
    public String user_modi_pwd() {

        return "user/user_modi_pwd";
    }

    @RequestMapping("/user_update_pwd")
    public String updatePwd(@Validated Admin admin, BindingResult result,
                            HttpServletRequest request, Model model ){

        if (result.hasErrors()){
            FieldError passwordEr = result.getFieldError("password");
            FieldError newPasswordEr = result.getFieldError("newPassword");
            FieldError reNewPasswordEr = result.getFieldError("reNewPassword");

            model.addAttribute("passwordEr",passwordEr);
            model.addAttribute("newPasswordEr",newPasswordEr);
            model.addAttribute("reNewPasswordEr",reNewPasswordEr);

            return "user/user_modi_pwd";
        }

        Admin admin1 = (Admin) request.getServletContext().getAttribute("admin");
        String oldPwd = admin1.getPassword();

        if (!oldPwd.equals(admin.getPassword())){
            model.addAttribute("passwordEr", "旧密码不正确, 请重新输入");
            model.addAttribute("newPwd", admin.getNewPassword());
            return "user/user_modi_pwd";
        }
        if (!admin.getReNewPassword().equals(admin.getNewPassword())){
            model.addAttribute("oldPwd", oldPwd);
            model.addAttribute("newPwd", admin.getNewPassword());
            model.addAttribute("reNewPasswordEr","两次密码输入不一致, 请重新输入");

            return "user/user_modi_pwd";
        }

        admin1.setPassword(admin.getNewPassword());

        adminService.updatePwd(admin1);

        return "login";
    }

}
