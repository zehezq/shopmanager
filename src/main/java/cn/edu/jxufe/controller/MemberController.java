package cn.edu.jxufe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
