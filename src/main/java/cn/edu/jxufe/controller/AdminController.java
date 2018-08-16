package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbAdmin;
import cn.edu.jxufe.services.TbAdminServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/9.
 */
@Controller
public class AdminController {
    @Autowired
    private TbAdminServer tbAdminServer;

    @ResponseBody
    @RequestMapping("register")
    public Object register(String account, String password) {
        /*List<TbAdmin> tbAdmin=tbAdminServer.selectBypassword(null);*/
        TbAdmin tbAdmin = new TbAdmin();
        tbAdmin.setAccount(account);
        tbAdmin.setPassword(password);
        System.out.println("帐号" + account);
        System.out.println("密码" + password);
        tbAdminServer.insertTbadmin(tbAdmin);
        return "login1";
    }

    /*@RequestMapping("loginbyid")
    public Object loginbyid(String account,String password,HttpServletResponse response){
        System.out.println("login");
        Map<String,String> map=new HashMap<String, String>();
        System.out.println("account"+account);
        map.put("account",account);
        List<TbAdmin> tbAdmin=tbAdminServer.selectBypassword(map);
        System.out.println("-----" + tbAdmin.size() + "------");*//*用来判断是否获取到对应数据*//*
        if (tbAdmin.size()!=0) {
            if (tbAdmin.get(0).getPassword().equals(password)) {
                Cookie nameCookie = new Cookie("account",account);
                //Cookie cookie = new Cookie("password",password);
                response.addCookie(nameCookie);
                //response.addCookie(cookie);
                nameCookie.setPath("/");//设置作用域
                System.out.println("登录成功！");
                return "member";
            } else {
                System.out.println("------" + tbAdmin.get(0).getPassword() + "--------" + password + "-----------");
                return "login1";
            }
        } else {
            System.out.println("----用户不存在------");
            return "login1";
        }

    }*/
    @ResponseBody
    @RequestMapping("login")
    public Object loginaa(TbAdmin tbAdmin) {
        String account=tbAdmin.getAccount();
        String password=tbAdmin.getPassword();
        System.out.println("用户名字:" + account);
        System.out.println("密码:" + password);
        List<TbAdmin> data = tbAdminServer.findAllAdmin();
        TbAdmin tbAdmin1=tbAdminServer.selectByAccount(account);
        System.out.println("account"+tbAdmin1.getAccount());
        System.out.println("account"+tbAdmin1.getPassword());
        String confirmpass=tbAdmin1.getPassword();
        if(!account.equals("")){
            if(password.equals(confirmpass)){
                System.out.println("正确登录");
                return "member";
            }else {
                System.out.println("密码错误，重新登录");
                return "login1";
            }
        }else {
            System.out.println("输入不规范");
            return "login1";
        }
    }
}
/*
zouziqian
*/
