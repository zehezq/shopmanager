package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbComment;
import cn.edu.jxufe.services.TbCommentServer;
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
public class CommentController {
    @Autowired
    private TbCommentServer tbCommentServer;

    @RequestMapping("tocomment")
    public Object toMember(){
        return "comment";
    }

    @RequestMapping("commentdata")
    @ResponseBody
    public Object commentdata(@RequestParam(name="page",defaultValue = "1") int page,@RequestParam(name="rows",defaultValue = "10") int rows){
        System.out.println("传递过来的page"+page);
        System.out.println("rows"+rows);
        try{
            PageInfo<TbComment> data=tbCommentServer.findAllComment(page,rows);
            Map map=new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception ex){
            ex.printStackTrace();
            return "{errmsg:"+ex.getMessage()+"}";
        }
    }

    @RequestMapping("commentbyid")
    public String toCommentbyid(int id,ModelMap map){
        System.out.println("会员编辑页面");
        TbComment tbComment=tbCommentServer.selectByPrimaryKey(id);
        map.put("tbComment",tbComment);
        return "editcomment";
    }
}
/*
zouziqian
*/
