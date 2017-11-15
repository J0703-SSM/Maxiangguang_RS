package com.baidu.admin.controller;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.service.AdminService;
import com.baidu.base.domain.PageBean;
import com.baidu.base.utils.Result;
import com.baidu.role.domain.Role;
import com.baidu.role.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/11/13.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private AdminService adminService;

    @Resource
    private RoleService roleService;

    /**
     * 查询所有
     */
    @RequestMapping("/admin_list")
    public String adminList(PageBean<Admin> pageBean, Model model){

        getPageProperties(pageBean);

        pageBean = adminService.findAll(pageBean);

        model.addAttribute("pageBean", pageBean);

        return "admin/admin_list";
    }
    /**
     * 设置pageBean的参数
     *
     * @param pageBean
     */
    private void getPageProperties(PageBean<Admin> pageBean) {
        int pc = pageBean.getPc();
        // 如果pc小于等于0, 令其等于1
        if (pc <= 0) {
            pageBean.setPc(1);
        }
        // 显示五条
        pageBean.setPs(5);

        // 设置url, 用于点击页面查询
        pageBean.setUrl("/admin/admin_list");
    }

    @RequestMapping("/admin_addPrep")
    public String adminAddPrep(Model model){

        List<Role> roleList = roleService.findAll();

        model.addAttribute("roleList",roleList);

        return "admin/admin_add";
    }

    @ResponseBody
    @RequestMapping("/admin_addP")
    public Result<Admin> adminAdd(@Validated Admin admin, BindingResult res){


        Result<Admin> result = new Result<>();
        result.setSuccess(true);
        return result;
    }


}
