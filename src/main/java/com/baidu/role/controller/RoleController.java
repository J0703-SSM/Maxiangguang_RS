package com.baidu.role.controller;

import com.baidu.base.domain.PageBean;
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

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by dllo on 17/11/14.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Resource
    private RoleService roleService;
    @Resource
    private PrivilegeService privilegeService;

    @RequestMapping("/role_list")
    public String roleList(PageBean<Role> pageBean,Model model){

        getPageProperties(pageBean);

        pageBean = roleService.findAll(pageBean);

        model.addAttribute("pageBean", pageBean);

        return "role/role_list";
    }
    /**
     *  设置pageBean的参数
     * @param pageBean
     */
    private void getPageProperties(PageBean<Role> pageBean) {
        int pc = pageBean.getPc();
        // 如果pc小于等于0, 令其等于1
        if (pc <= 0){
            pageBean.setPc(1);
        }
        // 显示五条
        pageBean.setPs(5);

        // 设置url, 用于点击页面查询
        pageBean.setUrl("/role/role_list");
    }

    @RequestMapping("/role_addPrep")
    public String addRolePrep(Model model){
        // 查询出所有的权限
        List<Privilege> privilegeList = privilegeService.findAll();

        model.addAttribute("privilegeList", privilegeList);
        return "/role/role_add";
    }

    @RequestMapping("/role_add")
    public String addRole(@Validated Role role, BindingResult result, Model model){
        System.out.println(role);

        // 判空
        if (result.hasErrors()){
            FieldError roleName = result.getFieldError("roleName");
            FieldError privilege = result.getFieldError("privilege");

            model.addAttribute("roleNameEr",roleName);
            model.addAttribute("privilegeEr",privilege);

            return "role/role_add";
        }

        // 表单回显
        model.addAttribute("roleName", role.getRoleName());

        // 查询该角色名是否存在
        Role role1 = roleService.findByName(role.getRoleName());

        // 存在返回到添加页面
        if (role1 != null){
            model.addAttribute("roleNameEr", "该角色已存在");
            model.addAttribute("privilegeList", privilegeService.findAll());
            return "role/role_add";
        }

        //插入数据库







        return "forward:/role_list";
    }

    @RequestMapping("/role_modiPrep")
    public String roleModiPrep(){

        return "/role/role_modi";
    }

    @RequestMapping("/delete_role")
    public String roleDelete(){
        return "/role/role_list";
    }

}
