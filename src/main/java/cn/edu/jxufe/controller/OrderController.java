package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbOrder;
import cn.edu.jxufe.services.TbOrderServer;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class OrderController {
    @Autowired
    private TbOrderServer tbOrderServer;

    @RequestMapping("toorder")
    public Object toMember(){
        return "order";
    }

    @RequestMapping("orderdata")
    @ResponseBody
    public Object orderdata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10") int rows){
        System.out.println("传递过来的page"+page);
        System.out.println("rows"+rows);
        try{
            PageInfo<TbOrder> data=tbOrderServer.findAllOrder(page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception ex){
            ex.printStackTrace();
            return "{errmsg:"+ex.getMessage()+"}";
        }
    }

    @RequestMapping("orderbyid")
    public String toOrderbyid(String id,ModelMap map){
        System.out.println("会员编辑页面");
        TbOrder tbOrder=tbOrderServer.selectByPrimaryKey(id);
        map.put("tbOrder",tbOrder);
        return "editorder";
    }
}
/*
zouziqian
*/
