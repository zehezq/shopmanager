package cn.edu.jxufe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class CategoryController {

    @RequestMapping("testCategory")
    @ResponseBody
    public Object testFindAllGoods(){
        return 0;
    }

    @RequestMapping("category")
    public String toCategory(){
        System.out.println("类别管理页面");
        return "category";
    }
}
