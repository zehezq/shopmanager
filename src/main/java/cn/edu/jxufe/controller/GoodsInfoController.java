package cn.edu.jxufe.controller;

import cn.edu.jxufe.services.TbGoodsServer;
import cn.edu.jxufe.services.TbOrderServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class GoodsInfoController {
    @Autowired
    private TbGoodsServer tbGoodsServer;

    @RequestMapping("testgoods")
    @ResponseBody
    public Object testFindAllGoods(){
        return tbGoodsServer.findAllGoods();
    }

    @RequestMapping("goods")
    public String toGoods(){
        System.out.println("商品管理页面");
        return "goods";
    }

}
/*
zouziqian
*/
