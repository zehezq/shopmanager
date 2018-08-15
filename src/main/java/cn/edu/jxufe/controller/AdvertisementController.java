package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbAdvertisement;
import cn.edu.jxufe.services.AdvertisementService;
import com.aliyun.oss.OSSClient;
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
import java.io.IOException;
import java.io.InputStream;
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
    public Object updateadv(TbAdvertisement adv){
        advertisementService.update(adv);
        System.out.println("修改广告");
        return "update";
    }




    @RequestMapping("uploadpic")
    @ResponseBody
    public Object uploadAdImage(@RequestParam("fs") MultipartFile f ,HttpServletRequest req){
        System.out.println("上传的文件名是"+f.getOriginalFilename());
        String endpoint = "http://oss-cn-beijing.aliyuncs.com";
        String accessKeyId = "LTAId0YVD63NHpVR";
        String accessKeySecret = "EVqEUGIqDqxcdomjYMohS2SlCFeG36";
        String buckName = "cnshop";
        OSSClient ossClient = new OSSClient(endpoint,accessKeyId,accessKeySecret);
        try {
            InputStream inputStream = f.getInputStream();
            ossClient.putObject(buckName,f.getOriginalFilename(),inputStream);
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            ossClient.shutdown();
        }
        return endpoint.replace("http://","http://"+buckName+".")+"/"+f.getOriginalFilename();
    }

    /*@RequestMapping("uploadpic")
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
    }*/

    @RequestMapping("addads")
    @ResponseBody
    public Object addCategory(TbAdvertisement adv){
        advertisementService.insert(adv);
        System.out.println("添加广告");
        return "add";
    }

    @RequestMapping("deleteadv")
    @ResponseBody
    public Object deleteadv(Integer adno) {
        int m = advertisementService.deleteAds(adno);
        if(m > 0)
            return "ok";
        else
            return "fail";
    }

}
