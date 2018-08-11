package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbGoods;
import cn.edu.jxufe.services.GoodsInfoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class GoodsInfoController {
    @Autowired
    private GoodsInfoService goodsInfoService;

    @RequestMapping("testgoods")
    @ResponseBody
    public Object testFindAllGoods(){

        return goodsInfoService.findAll();
    }

    @RequestMapping("goods")
    public String toGoods(){
        System.out.println("商品管理页面");
        return "goods";
    }

    @RequestMapping("goodsdata")
    @ResponseBody
    public Object advertisementdata(@RequestParam(name = "page",defaultValue = "1")int page,@RequestParam(name = "rows",defaultValue = "10") int rows){
        try{
            PageInfo<TbGoods> data = goodsInfoService.findAll(page, rows);
            HashMap map = new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception ex){
            ex.printStackTrace();
            return "{errmsg:"+ex.getMessage()+"}";
        }
    }

    @RequestMapping("goodsbyid")
    public String toAdvertisementByid(int id,ModelMap map){
        TbGoods g = goodsInfoService.findOne(id);
        map.put("g",g);
        return "goodsedit";
    }
}

