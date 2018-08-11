package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbAdmin;
import cn.edu.jxufe.services.TbAdminServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Created by Administrator on 2018/8/9.
 */
@Controller
public class AdminController {
    @Autowired
    private TbAdminServer tbAdminServer;

    @RequestMapping("loginbyid")
    public String toMemberbyid(TbAdmin tbAdmin,ModelMap map){
        System.out.println("会员编辑页面");
        TbAdmin admin=tbAdminServer.selectBypassword(tbAdmin);
        if(admin!=null){
            map.put("account",admin.getAccount());
            map.put("password",admin.getPassword());
            return "member";
        }
        return "error";
    }
}
/*
zouziqian
*/
