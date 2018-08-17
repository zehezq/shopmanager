package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbGoods;
import cn.edu.jxufe.services.GoodsInfoService;
import com.aliyun.oss.OSSClient;
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
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
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
    public Object advertisementdata(@RequestParam(name = "page",defaultValue = "1") int page,@RequestParam(name = "rows",defaultValue = "10") int rows){
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

    /*@RequestMapping("uploadgoodspic")
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
    }*/

    @RequestMapping("uploadgoodspic")
    @ResponseBody
    public Object uploadgoodspic(@RequestParam("fs") MultipartFile f ,HttpServletRequest req){
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

    @RequestMapping("updategoods")
    @ResponseBody
    public Object updategoods(TbGoods goods,BindingResult result){
        int m = goodsInfoService.updateGoods(goods);
        if(m != 0){
            return "修改成功";
        }else
            return "修改失败";
    }

    @RequestMapping("insertgoods")
    @ResponseBody
    public Object insertgoods(TbGoods goods){
        int m = goodsInfoService.insertGoods(goods);
        if(m != 0){
            return "添加成功";
        }else
            return "添加失败";
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

    @RequestMapping("findgoodsbyselect")
    @ResponseBody
    public Object findgoodsbyselect(@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "rows", defaultValue = "10") int rows,TbGoods goods) {
        try {
            goods.setCaption("%"+goods.getCaption()+"%");
            PageInfo<TbGoods> data = goodsInfoService.findBySelect(page, rows, goods);
            HashMap map = new HashMap();
            map.put("total", data.getTotal());
            map.put("rows", data.getList());
            return map;
        } catch (Exception ex) {
            ex.printStackTrace();
            return "{errmsg:" + ex.getMessage() + "}";
        }
    }

    /*@RequestMapping("findgoodsbyselect2")
    @ResponseBody
    public Object findgoodsbyselect2(TbGoods goods) {
        goods.setCaption("%"+goods.getCaption()+"%");
        List<TbGoods> data = goodsInfoService.findBySelect2(goods);
        return data;
    }*/


}

