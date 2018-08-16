package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbAdmin;
import cn.edu.jxufe.services.TbAdminServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class SystemController {
    @Autowired
    private TbAdminServer tbAdminServer;

    @RequestMapping("system")
    public String toSystem(){
        return "system";
    }

    @RequestMapping("login")
    public String toLogin(){
        return "login1";
    }


}
