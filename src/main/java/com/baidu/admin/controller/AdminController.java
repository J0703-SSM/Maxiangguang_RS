package com.baidu.admin.controller;

import com.baidu.admin.domain.Admin;
import com.baidu.admin.domain.domain_ext.AdminExt;
import com.baidu.admin.domain.domain_ext.PageBeanExt;
import com.baidu.admin.service.AdminService;
import com.baidu.base.domain.PageBean;
import com.baidu.base.utils.Result;
import com.baidu.privilege.domain.Privilege;
import com.baidu.privilege.service.PrivilegeService;
import com.baidu.role.domain.Role;
import com.baidu.role.service.RoleService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
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

    @Resource
    private PrivilegeService privilegeService;

    /**
     * 查询所有
     */
    @RequestMapping("/admin_list")
    public String adminList(PageBean<Admin> pageBean, Model model) {

        getPageProperties(pageBean);

        pageBean = adminService.findAll(pageBean);

        for (Admin admin : pageBean.getBeanList()) {
            List<String> list = new ArrayList<>();
            if (null != admin.getRole() || "".equals(admin.getRole())) {
                for (String s : admin.getRole().split(",")) {
                    list.add(s);
                }
                admin.setRoles(list);
            }
        }

        model.addAttribute("pageBean", pageBean);


        List<Privilege> privilegeList = privilegeService.findAll();
        model.addAttribute("privilegeList", privilegeList);

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
    public String adminAddPrep(Model model) {


        List<Role> roleList = roleService.findAll();

        model.addAttribute("roleList", roleList);

        return "admin/admin_add";
    }

    @RequestMapping("/admin_add")
    public String adminAdd(@Validated Admin admin, BindingResult res,
                           Model model, PageBean<Admin> pageBean) {

        List<Role> roleList = roleService.findAll();
        model.addAttribute("roleList", roleList);

        model.addAttribute("admin1", admin);

        if (admin != null) {
            if (null != admin.getRole()) {
                String[] split = admin.getRole().split(",");
                model.addAttribute("roles", split);
            }

            if (res.hasErrors()) {
                FieldError adminCodeEr = res.getFieldError("adminCode");
                FieldError nameEr = res.getFieldError("name");
                FieldError passwordEr = res.getFieldError("password");
                FieldError newPasswordEr = res.getFieldError("newPassword");
                FieldError telephoneEr = res.getFieldError("telephone");
                FieldError emailEr = res.getFieldError("email");
                FieldError roleEr = res.getFieldError("role");

                model.addAttribute("adminCodeEr", adminCodeEr);
                model.addAttribute("nameEr", nameEr);
                model.addAttribute("passwordEr", passwordEr);
                model.addAttribute("newPasswordEr", newPasswordEr);
                model.addAttribute("telephoneEr", telephoneEr);
                model.addAttribute("emailEr", emailEr);
                model.addAttribute("roleEr", roleEr);

                if (null != adminCodeEr || null != nameEr || null != passwordEr || null != roleEr
                        || null != newPasswordEr || null != telephoneEr || null != emailEr) {
                    return "admin/admin_add";
                }
            }
        }
        // adminCode查重
        Admin admin1 = adminService.findByAdminCode(admin);
        if (admin1 != null) {
            model.addAttribute("error1", "该名字已经被使用");
            return "admin/admin_add";
        }
        //验证邮箱电话号是否存在
        if (verifyEmailAndTel(admin, model)) {
            return "admin/admin_add";
        }

        // 设置雇佣时间
        admin.setEnrolldate(new Date());
        // 保存
        adminService.insertAdmin(admin);
        // 获取id
        Admin admin2 = adminService.findByAdminCode(admin);
        // 创建增强类adminExt
        AdminExt adminExt = new AdminExt();
        adminExt.setAdminId(admin2.getAdminId());

        for (String s : admin.getRole().split(",")) {
            // 查询role
            Role role = roleService.findByName(s);
            // 添加roleId
            adminExt.setRoleId(role.getRoleId());
            // 保存关系
            adminService.insertAdminAndRole(adminExt);

        }
        //调用查询所有
        adminList(pageBean, model);

        return "admin/admin_list";
    }

    private boolean verifyEmailAndTel(@Validated Admin admin, Model model) {
        // email查重
        Admin admin3 = adminService.findByEmail(admin);
        if (admin3 != null) {
            model.addAttribute("error2", "该email已经被使用");
            return true;
        }
        // telephone查重
        Admin admin4 = adminService.findByTel(admin);
        if (admin4 != null) {
            model.addAttribute("error3", "该电话号码已经被注册");
            return true;
        }
        return false;
    }

    /**
     * 修改
     */
    @RequestMapping("/admin_modiPrep")
    public String adminModiPrep(Admin admin, Model model) {

        admin = adminService.findByAdminId(admin);
        model.addAttribute("admin1", admin);

        rolesAndRoleList(admin, model);

        return "admin/admin_modi";
    }

    private void rolesAndRoleList(Admin admin, Model model) {

        List<Role> roleList = roleService.findAll();
        model.addAttribute("roleList", roleList);

        String[] split = admin.getRole().split(",");
        model.addAttribute("roles", split);
    }

    @RequestMapping("/admin_modi")
    public String adminModi(@Validated Admin admin, BindingResult res,
                            Model model, PageBean<Admin> pageBean) {

        rolesAndRoleList(admin, model);

        if (null != admin.getRole()) {
            String[] split = admin.getRole().split(",");
            model.addAttribute("roles", split);
        }

        if (res.hasErrors()) {
            FieldError nameEr = res.getFieldError("name");
            FieldError telephoneEr = res.getFieldError("telephone");
            FieldError emailEr = res.getFieldError("email");
            FieldError roleEr = res.getFieldError("role");

            model.addAttribute("nameEr", nameEr);
            model.addAttribute("telephoneEr", telephoneEr);
            model.addAttribute("emailEr", emailEr);
            model.addAttribute("roleEr", roleEr);

            if (null != nameEr || null != roleEr
                    || null != telephoneEr || null != emailEr) {
                return "admin/admin_modi";
            }
        }

        adminService.update(admin);

        adminList(pageBean, model);

        return "admin/admin_list";
    }

    @RequestMapping("/admin_delete")
    public void adminDelete(Admin admin) {

        System.out.println(admin);

        adminService.delete(admin);

        adminService.deleteAdminAndRole(admin);

    }

    /**
     * 高级查询
     *
     * @param pageBean
     * @param model
     * @return
     */
    @RequestMapping("/admin_find")
    public String adminFind(PageBeanExt pageBean,
                            Model model) {

        getPageProperties(pageBean);

        // 查询
        pageBean = adminService.findByRoleAndPrivilege(pageBean);

        for (Admin admin : pageBean.getBeanList()) {
            System.out.println(admin);
            for (Role role : admin.getRoleList()) {
                System.out.println(role);
            }
        }

        model.addAttribute("pageBean", pageBean);

        // 用于权限显示
        List<Privilege> privilegeList = privilegeService.findAll();
        model.addAttribute("privilegeList", privilegeList);

        return "admin/admin_list";
    }

    @ResponseBody
    @RequestMapping("/admin_updatePwd")
    public void adminUpdatePwd(Admin admin) {

        if (admin.getAdminId() != 0) {

            admin.setPassword("123456");
            adminService.updatePwd(admin);
        }

    }

}
