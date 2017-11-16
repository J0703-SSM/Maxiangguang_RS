package com.baidu.base.interceptor;

import com.baidu.admin.domain.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by dllo on 17/11/10.
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {


        String url = request.getRequestURI();// 获取请求路径

        // 排除登录请求
        if (url.indexOf("login") != -1){
            return true;//放行
        }
        if (url.indexOf("getVerifyCode") != -1){
            return true;
        }

        Admin admin = (Admin) request.getServletContext().getAttribute("admin");
        if (admin ==  null){
            // 没有登录过, 需要转发到登录页面
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request,response);
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
