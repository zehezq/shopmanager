package cn.edu.jxufe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Administrator on 2018/8/6.
 */
@Controller
public class PageController {
    @RequestMapping("page_{url}")
    public String toPage(@PathVariable("url") String url){
        System.out.println("通过控制器来访问jsp==>"+url);
        return url; //返回一个页面
    }
}
/*
zouziqian
*/
