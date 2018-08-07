package cn.edu.jxufe.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class AdvertisementController {

    @RequestMapping("advertisement")
    public String toAdvertisement(){
        System.out.println("广告管理页面");
        return "advertisement";
    }
}
