package cn.edu.jxufe.controller;

import cn.edu.jxufe.entity.TbCategory;
import cn.edu.jxufe.services.CategoryService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
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

    @RequestMapping("category")
    public String toCategory() {
        System.out.println("类别管理页面");
        return "category";
    }

    @RequestMapping("categorydata")
    @ResponseBody
    public Object categorydata(@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "rows", defaultValue = "10") int rows) {
        try {
            PageInfo<TbCategory> data = categoryService.findAll(page, rows);
            HashMap map = new HashMap();
            map.put("total", data.getTotal());
            map.put("rows", data.getList());
            return map;
        } catch (Exception ex) {
            ex.printStackTrace();
            return "{errmsg:" + ex.getMessage() + "}";
        }
    }

    @RequestMapping("categorybyid")
    public String toAdvertisementByid(int id, ModelMap map) {
        TbCategory category = categoryService.findOne(id);
        map.put("category", category);
        return "categoryedit";
    }

    @RequestMapping("addcategory")
    @ResponseBody
    public Object addCategory(TbCategory category) {
        int m = categoryService.insertCategory(category);
        if(m != 0){
            return "添加成功";
        }else
            return "添加失败";
    }

    @RequestMapping("updatecategory")
    @ResponseBody
    public Object updatecategory(TbCategory category, BindingResult result) {
        int m = categoryService.updateCategory(category);
        if(m != 0){
            return "修改成功";
        }else
            return "修改失败";
    }

    @RequestMapping("deletecateogry")
    @ResponseBody
    public Object deletecateogry(Integer[] code) {
        //TbCategory tbCategory = new TbCategory();
        for (int i = 0; i < code.length; i++) {
            //tbCategory.setCode(code[i]);
            //if (tbCategory.getCode() != 0) {
                categoryService.deleteCategory(code[i]);
        }
        return "ok";
    }

    @RequestMapping("deletecate")
    @ResponseBody
    public Object deletecate(Integer code) {
        int m = categoryService.deleteCategory(code);
        if(m > 0)
            return "ok";
        else
            return "fail";
    }

    @RequestMapping("categoryallcaption")
      @ResponseBody
      public String categoryallcaption(int code){
        return categoryService.findByid(code);
    }

    @RequestMapping("categoryall")
    @ResponseBody
    public Object categoryall(){
        return categoryService.findAll();
    }

    @RequestMapping("categorypartdata")
    @ResponseBody
    public Object categorypartdata(@RequestParam(name = "page", defaultValue = "1") int page, @RequestParam(name = "rows", defaultValue = "10") int rows,TbCategory category) {
        try {
            category.setCaption("%"+category.getCaption()+"%");
            PageInfo<TbCategory> data = categoryService.findByCodeOrCaption(page, rows,category);
            HashMap map = new HashMap();
            map.put("total", data.getTotal());
            map.put("rows", data.getList());
            return map;
        } catch (Exception ex) {
            ex.printStackTrace();
            return "{errmsg:" + ex.getMessage() + "}";
        }
    }



}
