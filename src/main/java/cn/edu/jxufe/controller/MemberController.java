package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbComment;
import cn.edu.jxufe.entity.TbUser;
import cn.edu.jxufe.services.TbCommentServer;
import cn.edu.jxufe.services.TbUserServer;
import com.aliyun.oss.OSSClient;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
public class MemberController {
    @Autowired
    private TbUserServer tbUserServer;

    @RequestMapping("page_member")
    public Object toMember(){
        return "member";
    }

    @RequestMapping("memberdata")
    @ResponseBody
    public Object memberdata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10") int rows){
        System.out.println("传递过来的page"+page);
        System.out.println("rows"+rows);
        try{
            PageInfo<TbUser> data=tbUserServer.findAllUser(page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception ex){
            ex.printStackTrace();
            return "{errmsg:"+ex.getMessage()+"}";
        }
    }

    @RequestMapping("memberbyid")
    public String toMemberbyid(int id,ModelMap map){
        System.out.println("会员编辑页面");
        TbUser tbUser=tbUserServer.selectByUserId(id);
        map.put("tbUser",tbUser);
        return "editmember";
    }

    /*@RequestMapping("uploadimage")
    @ResponseBody
    public Object upLoadImage(@RequestParam("fs") MultipartFile file,HttpServletRequest request){//与html中表单的name匹配
        //获取服务器的upload文件夹绝对路径
        String path=request.getSession().getServletContext().getRealPath("upload/");
        System.out.println("站点的实际文件路径" + path);
        String fileName=UUID.randomUUID().toString()+file.getOriginalFilename();
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

    @RequestMapping("uploadimage")
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
    }


    /*@RequestMapping("uploaduserpic")
    @ResponseBody
    public Object uploadUserImage(@RequestParam("fs") MultipartFile f ,HttpServletRequest req){
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

    @RequestMapping("saveupdatedata")
    @ResponseBody
    public Object saveupdatedata(TbUser tbUser){

        if(tbUser.getUserid()!=0){
            tbUserServer.updateTbuser(tbUser);
            return "update";
        }else
            return "error";
    }

    @RequestMapping("adddata")
    @ResponseBody
    public Object adddata(TbUser tbUser){
        tbUserServer.insertTbuser(tbUser);
            return "add";
    }

    @RequestMapping("memberbyphone")
    public String memberbyphone(String phone,ModelMap map){
        System.out.println("会员编辑页面");
        TbUser tbUser=tbUserServer.selectByphone(phone);
        map.put("tbUser",tbUser);
        return "search";
    }

    @RequestMapping("deletedata")
    @ResponseBody
    public Object deletedata(int userid){
        TbUser tbUser=new TbUser();
        int num=tbUserServer.deleteByUserId(userid);
        if(num>0){
            return "success";
        }else
            return "fail";
    }

    @RequestMapping("selectbynameandphone")
    @ResponseBody
    public Object selectByNameAndPhone(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10") int rows,TbUser tbUser){
        System.out.println("传递过来的page"+page);
        System.out.println("rows"+rows);
        try{
            PageInfo<TbUser> data=tbUserServer.selectByNameAndPhone(page,rows,tbUser);
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
