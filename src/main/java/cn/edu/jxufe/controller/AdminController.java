package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbAdmin;
import cn.edu.jxufe.services.TbAdminServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

    @RequestMapping("loginbyid")
    public Object loginbyid(String account,String password,HttpServletResponse response){
        System.out.println("login");
        Map<String,String> map=new HashMap<String, String>();
        map.put("account",account);
        List<TbAdmin> tbAdmin=tbAdminServer.selectBypassword(map);
        System.out.println("-----" + tbAdmin.size() + "------");/*用来判断是否获取到对应数据*/
        if (tbAdmin.size()!=0) {
            if (tbAdmin.get(0).getPassword().equals(password)) {
                Cookie nameCookie = new Cookie("account",account);
                Cookie cookie = new Cookie("password",password);
                response.addCookie(nameCookie);
                response.addCookie(cookie);
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

    }
}
/*
zouziqian
*/
