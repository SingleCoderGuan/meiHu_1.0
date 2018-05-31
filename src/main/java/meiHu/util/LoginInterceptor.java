package meiHu.util;

import meiHu.entity.ForumUser;
import org.springframework.lang.Nullable;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor{
    //身份检测
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

        //安全认证
        String url = request.getRequestURI();
        if(url.endsWith("login.jsp")||url.endsWith("main.action")||url.endsWith("/")){
            return true;
        }
        //如果是已经登录过的
        HttpSession session = request.getSession();
        ForumUser user = (ForumUser) session.getAttribute("user");
        if(user!=null){
            return true;
        }

//        其他情况下，转发到登录页面
        request.getRequestDispatcher("jsp/login.jsp").forward(request,response);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, @Nullable Exception ex) throws Exception {

    }
}
