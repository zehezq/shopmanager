package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbArticle;
import cn.edu.jxufe.services.TbArticleServer;
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
    @RequestMapping("toarticle")
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

   /* @RequestMapping("uploaddire")
    @ResponseBody
    public Object upLoadImage(@RequestParam("fs") MultipartFile file,HttpServletRequest request){//与html中表单的name匹配
        System.out.println("准备上传");
        System.out.println("输出上传的文件名："+file.getOriginalFilename());
        //获取服务器的upload文件夹绝对路径
        String path=request.getSession().getServletContext().getRealPath("upload/");
        System.out.println("站点的实际文件路径"+path);
        String fileName= UUID.randomUUID().toString()+file.getOriginalFilename();
        try{
            FileOutputStream fout=new FileOutputStream(path+ fileName);
            fout.write(file.getBytes());
            fout.close();
            return "upload/"+fileName;
        }catch (Exception ex){
            ex.printStackTrace();
            return null;
        }
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
}
/*
zouziqian
*/
