package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbGoods;
import cn.edu.jxufe.services.GoodsInfoService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.UUID;

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
        TbGoods goods = goodsInfoService.findOne(id);
        map.put("goods",goods);
        return "goodsedit";
    }

    @RequestMapping("uploadgoodspic")
    @ResponseBody
    public Object uploadgoodspic(@RequestParam("fs") MultipartFile f ,HttpServletRequest req){
        //获取服务器的upload文件夹绝对路径
        String path=req.getSession().getServletContext().getRealPath("upload/");
        String fileName= UUID.randomUUID().toString()+f.getOriginalFilename();
        try {
            FileOutputStream fou = new FileOutputStream(path +fileName);
            fou.write(f.getBytes());
            fou.close();
            return "upload/"+fileName;
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }

    @RequestMapping("updategoods")
    @ResponseBody
    public Object updategoods(TbGoods goods,BindingResult result){
        goodsInfoService.updateGoods(goods);
        System.out.println("修改商品");
        return "修改成功";
    }

    @RequestMapping("insertgoods")
    @ResponseBody
    public Object insertgoods(TbGoods goods){
        goodsInfoService.insertGoods(goods);
        System.out.println("添加商品");
        return "insert";
    }

    @RequestMapping("deletegoods")
    @ResponseBody
    public Object deletegoods(Integer goodid) {
        int m = goodsInfoService.deleteGoods(goodid);
        if(m > 0)
            return "ok";
        else
            return "fail";
    }


}

