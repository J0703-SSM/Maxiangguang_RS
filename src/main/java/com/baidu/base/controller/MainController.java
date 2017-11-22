package com.baidu.base.controller;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.service.AdminService;
import com.baidu.base.utils.VerifyCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    public String login(@Validated Admin admin, BindingResult result,
                        HttpServletRequest request, Model model) {

        System.out.println(admin);
        System.out.println(text);
        // 判空
        if (result.hasErrors()) {
            FieldError nameError = result.getFieldError("adminCode");
            FieldError pwdError = result.getFieldError("password");

            model.addAttribute("nameError", nameError);
            model.addAttribute("pwdError", pwdError);
        }
        model.addAttribute("name", admin.getAdminCode());
        model.addAttribute("password", admin.getPassword());
        if ("".equals(admin.getCode())){
            model.addAttribute("codeError", "验证码不能为空");
            return "login";
        }

        // 判断验证码是否相等
        if (!text.equalsIgnoreCase(admin.getCode())) {
            model.addAttribute("codeError", "验证码不正确");
            return "login";
        }

        Admin admin1 = adminService.findByNameAndPsw(admin);
        if (null == admin1) {
            model.addAttribute("error", "用户名或密码错误，请重试");
            return "login";
        }


        request.getServletContext().setAttribute("admin", admin1);

        return "index";
    }

    @RequestMapping("/index")
    public String index() {

        return "index";
    }

    @RequestMapping("nopower")
    public String noPower(){
        return "nopower";
    }


    @RequestMapping("error")
    public String error(){
        return "error";
    }


    /**
     *  退出
     * @param request
     * @return
     */
    @RequestMapping("/exit")
    public String exit(HttpServletRequest request){

        request.getServletContext().removeAttribute("admin");

        return "/login";
    }







}
