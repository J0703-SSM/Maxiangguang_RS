package com.baidu.cost.interceptor;

import com.baidu.admin.domain.Admin;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by dllo on 17/11/21.
 */
public class CostInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {


        String url = request.getRequestURI();// 获取请求路径

        // 排除登录请求
        if (url.indexOf("fee/fee_list") != -1){
            return true;//放行
        }
        if (url.indexOf("fee/findAllFee") != -1){
            return true;
        }

        Admin admin = (Admin) request.getServletContext().getAttribute("admin");
        if (!admin.getPrivilege().contains("资费管理")){
            // 没有登录过, 需要转发到登录页面
            request.getRequestDispatcher("/WEB-INF/pages/error.jsp").forward(request,response);
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
