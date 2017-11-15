package com.baidu.role.controller;

import com.baidu.base.domain.PageBean;
import com.baidu.base.utils.Result;
import com.baidu.privilege.domain.Privilege;
import com.baidu.privilege.service.PrivilegeService;
import com.baidu.role.domain.Role;
import com.baidu.role.domain.RoleAndPrivilege;
import com.baidu.role.service.RoleService;
import com.mchange.v1.util.ListUtils;
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
    public String roleList(PageBean<Role> pageBean, Model model) {

        getPageProperties(pageBean);

        pageBean = roleService.findAll(pageBean);

        model.addAttribute("pageBean", pageBean);

        return "role/role_list";
    }

    /**
     * 设置pageBean的参数
     *
     * @param pageBean
     */
    private void getPageProperties(PageBean<Role> pageBean) {
        int pc = pageBean.getPc();
        // 如果pc小于等于0, 令其等于1
        if (pc <= 0) {
            pageBean.setPc(1);
        }
        // 显示五条
        pageBean.setPs(5);

        // 设置url, 用于点击页面查询
        pageBean.setUrl("/role/role_list");
    }

    @RequestMapping("/role_addPrep")
    public String addRolePrep(Model model) {
        // 查询出所有的权限
        List<Privilege> privilegeList = privilegeService.findAll();

        model.addAttribute("privilegeList", privilegeList);
        return "role/role_add";
    }

    @RequestMapping("/role_add")
    public String addRole(@Validated Role role, BindingResult result, PageBean<Role> pageBean, Model model) {
        System.out.println(role);

        // 判空
        if (result.hasErrors()) {
            FieldError roleName = result.getFieldError("roleName");
            FieldError privilege = result.getFieldError("privilege");

            model.addAttribute("roleNameEr", roleName);
            model.addAttribute("privilegeEr", privilege);
            model.addAttribute("roleName", role.getRoleName());
            model.addAttribute("privilegeList", privilegeService.findAll());
            return "role/role_add";
        }

        // 表单回显
        model.addAttribute("roleName", role.getRoleName());

        // 查询该角色名是否存在
        Role role1 = roleService.findByName(role.getRoleName());

        // 存在返回到添加页面
        if (role1 != null) {
            model.addAttribute("roleNameEr", "该角色已存在");
            model.addAttribute("privilegeList", privilegeService.findAll());
            return "role/role_add";
        }

        //将role插入数据库
        roleService.insert(role);
        // 查询户插入角色的id
        Role role2 = roleService.findByName(role.getRoleName());

        for (String s : role.getPrivilege().split(",")) {
            // 根据name查询privilege,
            Privilege privilege = privilegeService.findByName(s);
            // 创建RoleAndPrivilege对象(装载roleId 和 privilegeId)
            RoleAndPrivilege rp = new RoleAndPrivilege(role2.getRoleId(), privilege.getPrivilegeId());
            // 插入数据库
            roleService.insertRoleAndPrivilege(rp);
        }

        // 调用查询所有
        roleList(pageBean, model);

        return "role/role_list";
    }

    @RequestMapping("/role_modiPrep")
    public String roleModiPrep(Role role, Model model) {

        System.out.println(role);

        // 根据id查询role
        Role role1 = roleService.findById(role.getRoleId());

        // 查询所有的privilege
        List<Privilege> privilegeList = privilegeService.findAll();

        model.addAttribute("role", role1);
        model.addAttribute("privilegeList", privilegeList);

        if (null != role1.getPrivilege()) {
            model.addAttribute("split", role1.getPrivilege().split(","));
        }

        return "role/role_modi";
    }

    /**
     * 编辑角色
     */
    @RequestMapping("/role_modi")
    public String roleModi(@Validated Role role, BindingResult result,
                           PageBean<Role> pageBean, Model model) {
        // 判空
        if (result.hasErrors()) {
            FieldError roleNameEr = result.getFieldError("roleName");
            FieldError privilegeEr = result.getFieldError("privilege");

            model.addAttribute("roleNameEr", roleNameEr);
            model.addAttribute("privilegeEr", privilegeEr);

            return "role/role_modi";

        }
        // 验证是否存在
        Role role1 = roleService.findByName(role.getRoleName());
        if (null != role1) {
            model.addAttribute("roleNameEr", "该角色名已被使用, 请重新输入");
            model.addAttribute("role", role1);
            model.addAttribute("privilegeList", privilegeService.findAll());
            return "role/role_modi";
        }

        // 更新role
        roleService.update(role);

        // 删除该用户的role_privilege数据
        roleService.deleteRoleAndPrivilege(role.getRoleId());

        // 添加新的数据
        for (String s : role.getPrivilege().split(",")) {
            Privilege privilege = privilegeService.findByName(s);
            RoleAndPrivilege rp = new RoleAndPrivilege(role.getRoleId(), privilege.getPrivilegeId());
            roleService.insertRoleAndPrivilege(rp);
        }

        // 调用查询所有
        roleList(pageBean, model);

        return "role/role_list";
    }

    @RequestMapping("/delete_role")
    public void roleDelete(Role role) {

        System.out.println(role);

        roleService.deleteById(role.getRoleId());
        roleService.deleteRoleAndPrivilege(role.getRoleId());
    }

}
