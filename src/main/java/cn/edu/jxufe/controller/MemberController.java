package cn.edu.jxufe.controller;

import cn.edu.jxufe.services.TbGoodsServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class MemberController {

    @RequestMapping("tomember")
    public Object toMember(){
        return "member";
    }
}
/*
zouziqian
*/
