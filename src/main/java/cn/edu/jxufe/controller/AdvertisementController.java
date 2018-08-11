package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbAdvertisement;
import cn.edu.jxufe.services.AdvertisementService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileOutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class AdvertisementController {
    @Autowired
    private AdvertisementService advertisementService;

    @RequestMapping("advertisement")
    public String toAdvertisement(){
        System.out.println("广告管理页面");
        return "advertisement";
    }

    @RequestMapping("advertisementdata")
    @ResponseBody
    public Object advertisementdata(@RequestParam(name = "page",defaultValue = "1")int page,@RequestParam(name = "rows",defaultValue = "10") int rows){
        try{
            PageInfo<TbAdvertisement> data = advertisementService.findAll(page, rows);
            HashMap map = new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception ex){
            ex.printStackTrace();
            return "{errmsg:"+ex.getMessage()+"}";
        }
    }

    @RequestMapping("advertisementbyid")
    public String toAdvertisementByid(int id,ModelMap map){
        TbAdvertisement adv = advertisementService.findOne(id);
        map.put("adv",adv);
        return "adsedit";
    }

    @RequestMapping("updateadv")
    @ResponseBody
    public Object updateadv(TbAdvertisement adv/*@RequestParam("index")int index,@RequestParam("title")String title,@RequestParam("url")String url*/){
        /*TbAdvertisement adv = new TbAdvertisement();
        adv.setIndex(index);
        adv.setTitle(title);
        adv.setUrl(url);
        adv.setStatus(status);
        adv.setPicurl(picurl);*/
        advertisementService.update(adv);
        System.out.println("修改广告");
        //adv.setCreatetime(cretetime);
        return "update";
    }

    /*@RequestMapping("uploadpic")
    @ResponseBody
    public Object uploadAdImage(@RequestParam("fs")MultipartFile f,HttpServletRequest req){
        String path = req.getSession().getServletContext().getRealPath("upload/");
        String fileName = UUID.randomUUID().toString()+f.getOriginalFilename();
        try{
            FileOutputStream fou = new FileOutputStream(path+fileName);
            fou.write(f.getBytes());
            fou.close();
            return fileName;
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
    }*/

    @RequestMapping("uploadpic")
    @ResponseBody
    public Object uploadAdImage(@RequestParam("fs") MultipartFile f ,HttpServletRequest req){
        //获取服务器的upload文件夹绝对路径
        String path=req.getSession().getServletContext().getRealPath("upload/");
        String fileName=UUID.randomUUID().toString()+f.getOriginalFilename();
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

}
