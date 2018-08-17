package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbAdmin;
import cn.edu.jxufe.services.TbAdminServer;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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

    private String acc;

    @RequestMapping("admin")
    public String toAdvertisement(){
        System.out.println("管理员页面");
        return "admin";
    }

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
                acc = account;
                System.out.println(acc);
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

    @RequestMapping("confirmpwd")
    @ResponseBody
    public Object confirmpwd(TbAdmin admin){
        String pwd = admin.getPassword();
        System.out.println(pwd);
        TbAdmin ad = tbAdminServer.selectPassword(acc);
        String password = ad.getPassword();
        System.out.println(password);
        if(password.equals(pwd)){
            return "ok";
        }else
            return "fail";
    }

    @RequestMapping("updatepwd")
    @ResponseBody
    public Object updatepwd(TbAdmin ad){
        TbAdmin admin = new TbAdmin();
        admin.setAccount(acc);
        admin.setPassword(ad.getPassword());
        System.out.println(acc);
        int m = tbAdminServer.updatePwd(admin);
        if(m != 0){
            return 1;
        }else
            return 0;
    }

    @RequestMapping("admindata")
    @ResponseBody
    public Object admindata(@RequestParam(name = "page",defaultValue = "1")int page,@RequestParam(name = "rows",defaultValue = "10") int rows){
        try{
            PageInfo<TbAdmin> data = tbAdminServer.findAll(page, rows);
            HashMap map = new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception ex){
            ex.printStackTrace();
            return "{errmsg:"+ex.getMessage()+"}";
        }
    }

    @RequestMapping("updatestyle")
    @ResponseBody
    public Object updatestyle(TbAdmin admin, BindingResult result) {
        int m = tbAdminServer.updateStyle(admin);
        if(m != 0){
            return "修改成功";
        }else
            return "修改失败";
    }

    @RequestMapping("adminbyaccount")
    public Object adminbyaccount(String account, ModelMap map) {
        System.out.println(account);
        TbAdmin admin = tbAdminServer.findOne(account);
        map.put("admin", admin);
        return "adminedit";
    }

    @RequestMapping("addadmin")
    @ResponseBody
    public Object addadmin(TbAdmin admin) {
        int m = tbAdminServer.insertAdmin(admin);
        if(m != 0){
            return "添加成功";
        }else
            return "添加失败";
    }
}
/*
zouziqian
*/
