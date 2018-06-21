package meiHu.util;

import meiHu.entity.ForumUser;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    //身份检测
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //安全认证
//        String url = request.getRequestURI();
//        if (url.endsWith("loginregister.jsp") || url.endsWith("loginadmin.jsp") || url.endsWith("/") || url.endsWith("adminlogin.jsp")) {
//            return true;
//        }

        //如果是已经登录过的
//        HttpSession session = request.getSession();
//        if(session.getAttribute("admin")!=null){
//            return true;
//        }
//        response.sendRedirect(request.getContextPath()+"/admin/adminlogin.jsp");
////        request.getRequestDispatcher("/jsp/adminlogin.jsp").forward(request, response);
       return false;


    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {

    }
}
