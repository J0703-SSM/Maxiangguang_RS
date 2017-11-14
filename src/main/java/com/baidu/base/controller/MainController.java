package com.baidu.base.controller;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.service.AdminService;
import com.baidu.base.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;

/**
 * Created by dllo on 17/11/10.
 */
@Controller
public class MainController {

    @Resource
    private AdminService adminService;

    private String text;


    /**
     * 设置首页
     */
    @RequestMapping("/")
    public String home() {
        return "login";
    }

    @RequestMapping("/getVerifyCode")
    public void getCode(HttpServletResponse response) throws IOException {
        // 创建新的对象
        VerifyCode code = new VerifyCode();
        // 生成验证图片
        BufferedImage codeImage = code.getImage();
        // 验证码内容
        text = code.getText();
        // 输出页面
        VerifyCode.output(codeImage, response.getOutputStream());
    }

    /**
     * 登录
     */
    @RequestMapping("/login")
    public String login(@Validated Admin admin, HttpSession session,
                        BindingResult result, Model model) {

        System.out.println(admin);
        System.out.println(text);
        // 判空
//        if (result.hasErrors()) {
//            FieldError nameError = result.getFieldError("adminCode");
//            FieldError pwdError = result.getFieldError("password");
//
//            model.addAttribute("nameError", nameError);
//            model.addAttribute("pwdError", pwdError);
//        }

        // 判断验证码
        if (!text.equals(admin.getCode())) {
            model.addAttribute("codeError", "验证码不正确");
            return "login";
        }

        Admin admin1 = adminService.findByNameAndPsw(admin);
        if (null == admin1) {
            model.addAttribute("error", "用户名或密码错误，请重试");
            return "login";
        }

        session.setAttribute("admin", admin1);

        return "index";
    }

    @RequestMapping("/index")
    public String index() {

        return "index";
    }


    @RequestMapping("/account_list")
    public String accountList() {
        return "account/account_list";
    }

    @RequestMapping("/service_list")
    public String serviceList() {

        return "service/service_list";
    }

    @RequestMapping("/bill_list")
    public String billList() {
        return "bill/bill_list";
    }

    @RequestMapping("/report_list")
    public String reportList() {
        return "report/report_list";
    }

    @RequestMapping("/user_info")
    public String userList() {
        return "user/user_info";
    }

    @RequestMapping("/user_modi_pwd")
    public String user_modi_pwd() {
        return "user/user_modi_pwd";
    }


}
