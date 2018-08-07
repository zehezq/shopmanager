package cn.edu.jxufe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/2.
 */
@Controller
public class UserController {
    public  UserController(){
        System.out.println("controller启动");
    }

    //定义请求路径（可在网页上显示）
    //设置响应的结果为一个json字符串
    @RequestMapping("user")
    @ResponseBody
    public Object getUser(){
        Map map=new HashMap();
        map.put("n","zzq");
        map.put("p","123");
        return map;
    }

//    @RequestMapping("login")
//    @ResponseBody
//    public Object login(String n,String p){
//        System.out.println("传入一个参数："+n);
//        System.out.println("传入一个参数："+p);
//        if(n.equals("13423712915") && p.equals("123456"))
//            return "登陆成功";
//        else
//            return "登陆失败";
//    }

//    @RequestMapping("zzq")
//    public String cxkun(){
//        System.out.println("通过控制器来访问jsp");
//        return "index"; //返回一个页面
//    }

//    @RequestMapping("boy")
//    // 返回的String类型的值代表了转向页面的路径
//    public String kzhiqi(ModelMap map){
//        System.out.println("通过控制器来访问jsp");
//        // 将来通过自定义的业务逻辑对象来获取数据库中的对象，然后装入到ModelMap中
//        UserInfo u=new UserInfo();
//        u.setName("zzzq");
//        u.setPwd("123123");
//        map.put("ha",u); // 往ModelMap中装入数据
//        // 返回页面的时候，在页面上输出控制器中的内容
//        return "zzz"; // 返回一个页面
//    }


//    @RequestMapping("finduser")
//    @ResponseBody
//    public Object getUserId(Integer uid){
//        System.out.println("传入一个参数："+uid);
//        System.out.println("dddd");
//        Map map=new HashMap();
//        map.put("uid",uid);
//        map.put("name","zouziqian");
//        map.put("pwd","123");
//        return map;
//    }

//    @RequestMapping("fuser{uid}")
//    @ResponseBody
//    public Object getFuserId(@PathVariable("uid") Integer uid){
//        System.out.println("传入一个参数："+uid);
//        System.out.println("dddd");
//        Map map=new HashMap();
//        map.put("uid",uid);
//        map.put("name","zouziqian");
//        map.put("pwd","123");
//        return map;
//    }

//    @RequestMapping("checklogin")
//    @ResponseBody
//    public Object checklogin(UserInfo userInfo){
//        System.out.println("传入一个参数："+userInfo.getName());
//        System.out.println("传入一个参数："+userInfo.getPwd());
//        Map map=new HashMap();
//        map.put("name", userInfo.getName());
//        map.put("pwd",userInfo.getPwd());
//        return map;
//    }
}
/*
zouziqian
*/
