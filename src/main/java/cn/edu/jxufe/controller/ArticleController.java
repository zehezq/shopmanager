package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbArticle;
import cn.edu.jxufe.services.TbArticleServer;
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
import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class ArticleController {
    @Autowired
    private TbArticleServer tbArticleServer;
    @RequestMapping("page_article")
    public Object toMember(){
        return "article";
    }

    @RequestMapping("articledata")
    @ResponseBody
    public Object articledata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10") int rows){
        System.out.println("传递过来的page"+page);
        System.out.println("rows"+rows);
        try{
            PageInfo<TbArticle> data=tbArticleServer.findAllArticle(page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception ex){
            ex.printStackTrace();
            return "{errmsg:"+ex.getMessage()+"}";
        }
    }

    @RequestMapping("articlebyid")
    public String toArticlebyid(int id,ModelMap map){
        System.out.println("会员编辑页面");
        TbArticle tbArticle=tbArticleServer.selectByPrimaryKey(id);
        map.put("tbArticle",tbArticle);
        return "editarticle";
    }

    /*@RequestMapping("uploadarticle")
    @ResponseBody
    public Object uploadAdImage(@RequestParam("fs") MultipartFile file ,HttpServletRequest request){
        System.out.println("上传的文件名是"+file.getOriginalFilename());
        String endpoint = "http://oss-cn-beijing.aliyuncs.com";
        String accessKeyId = "LTAId0YVD63NHpVR";
        String accessKeySecret = "EVqEUGIqDqxcdomjYMohS2SlCFeG36";
        String buckName = "cnshop";
        OSSClient ossClient = new OSSClient(endpoint,accessKeyId,accessKeySecret);
        try {
            InputStream inputStream = file.getInputStream();
            ossClient.putObject(buckName,file.getOriginalFilename(),inputStream);
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            ossClient.shutdown();
        }
        return endpoint.replace("http://","http://"+buckName+".")+"/"+file.getOriginalFilename();
    }*/

    @RequestMapping("updatearticle")
    @ResponseBody
    public Object updatearticle(TbArticle tbArticle){
            tbArticleServer.updateTbArticle(tbArticle);
            return "update";
    }

    @RequestMapping("addarticle")
    @ResponseBody
    public Object addarticle(TbArticle tbArticle){
        tbArticleServer.insertTbArticle(tbArticle);
        return "add";
    }

    @RequestMapping("deletearticle")
    @ResponseBody
    public Object deletearticle(Integer id){
        System.out.println(id);
        int num=tbArticleServer.deleteByTbArticleId(id);
        if (num>0){
            return "success";
        }
        return "fail";
    }

    @RequestMapping("selectbyidortitle")
    @ResponseBody
    public Object selectbyidortitle(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10") int rows,TbArticle tbArticle){
        System.out.println("传递过来的page"+page);
        System.out.println("rows"+rows);
        try{
            PageInfo<TbArticle> data=tbArticleServer.selectByIdOrTitle(page,rows,tbArticle);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception ex){
            ex.printStackTrace();
            return "{errmsg:"+ex.getMessage()+"}";
        }
    }
}
/*
zouziqian
*/
