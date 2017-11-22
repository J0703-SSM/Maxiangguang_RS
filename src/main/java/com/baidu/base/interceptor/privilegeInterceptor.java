package com.baidu.base.interceptor;

import com.baidu.admin.domain.Admin;
import com.baidu.privilege.domain.Privilege;
import com.baidu.role.domain.Role;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by dllo on 17/11/21.
 */
public class privilegeInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {

        // 获取请求路径
        String url = request.getRequestURI();
        Admin admin = (Admin) request.getServletContext().getAttribute("admin");
        if (getPrivileges(url, admin, "admin/", 1)) return true;
        if (getPrivileges(url, admin, "role/", 2)) return true;
        if (getPrivileges(url, admin, "fee/", 3)) return true;
        if (getPrivileges(url, admin, "account/", 4)) return true;
        if (getPrivileges(url, admin, "service/", 5)) return true;
        if (getPrivileges(url, admin, "report/", 6)) return true;
        if (getPrivileges(url, admin, "bill/", 7)) return true;

        request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request, response);

        return false;
    }

    private boolean getPrivileges(String url, Admin admin, String s, int privilegeId) {
        if (admin != null && url.indexOf(s) != -1) {
            for (Role role : admin.getRoleList()) {
                for (Privilege privilege : role.getPrivilegeList()) {
                    if (privilege.getPrivilegeId() == privilegeId) {
                        return true;
                    }
                }
            }
        }
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
