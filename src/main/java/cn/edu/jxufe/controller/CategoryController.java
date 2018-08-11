package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbCategory;
import cn.edu.jxufe.services.CategoryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.swing.text.AbstractDocument;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/7.
 */
@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("testCategory")
    @ResponseBody
    public Object testFindAllGoods(){
        return 0;
    }

    @RequestMapping("category")
    public String toCategory(){
        System.out.println("类别管理页面");
        return "category";
    }

    @RequestMapping("categorydata")
    @ResponseBody
    public Object advertisementdata(@RequestParam(name = "page",defaultValue = "1")int page,@RequestParam(name = "rows",defaultValue = "10") int rows){
        try{
            PageInfo<TbCategory> data = categoryService.findAll(page, rows);
            HashMap map = new HashMap();
            map.put("total",data.getTotal());
            map.put("rows",data.getList());
            return map;
        }catch (Exception ex){
            ex.printStackTrace();
            return "{errmsg:"+ex.getMessage()+"}";
        }
    }

    /*@RequestMapping("/categorydata")
    @ResponseBody
    public Object insertCategory(@RequestParam("index")int id,@RequestParam("caption")String caption,@RequestParam("status")int status,@RequestParam("updatetime")String updatetime){
       TbCategory category = new TbCategory();
        category.setId(id);
        category.setCaption(caption);
        category.setStatus(status);
        category.setUpdatetime(updatetime);
        int m = categoryService.insertCategory(category);
        if(m == 1){
            return "ok";
        }else
            return "failed";

    }*/

    @RequestMapping("categorybyid")
    public String toAdvertisementByid(int id,ModelMap map){
        TbCategory cate = categoryService.findOne(id);
        map.put("cate",cate);
        return "categoryedit";
    }

    /*@RequestMapping("addcategory")
    @ResponseBody
    public Object addCategory(@RequestParam("id")int id,@RequestParam("caption")String caption,@RequestParam("status")int status,@RequestParam("createtime")String createtime){
        TbCategory category = new TbCategory();
        category.setId(id);
        category.setCaption(caption);
        category.setStatus(status);
        category.setUpdatetime(createtime);
        categoryService.insertCategory(category);
        System.out.println("添加商品类别");
        return "add";
    }*/

    @RequestMapping("addcategory")
    @ResponseBody
    public Object addCategory(TbCategory category){
        categoryService.insertCategory(category);
        System.out.println("添加商品类别");
        return "add";
    }


}
