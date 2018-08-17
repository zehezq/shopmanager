package cn.edu.jxufe.interceptor;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Administrator on 2018/8/16.
 */
@Component
public class CheckSession implements HandlerInterceptor{
    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        System.out.println("进入控制器之前运行");
        Object object=httpServletRequest.getSession().getAttribute("loginuser");
        if(object!=null){
            System.out.println("登录中...");
            return true;
        }else {
            //重定向,让页面重新访问login.html
            System.out.println("重定向");
            httpServletResponse.sendRedirect("login.html");
            return false;
        }
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {
        System.out.println("控制器执行完成");
    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {
        System.out.println("控制器执行完毕并且已经跳转到页面");
    }
}
/*
zouziqian
*/
