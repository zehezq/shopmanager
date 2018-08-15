package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbCategoryDAO;
import cn.edu.jxufe.entity.TbCategory;
import cn.edu.jxufe.services.CategoryService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
@Service
public class CategoryServiceImpl implements CategoryService {
    @Autowired
    private TbCategoryDAO tbCategoryDAO;
    @Override
    public List<TbCategory> findAll() {
        return tbCategoryDAO.findAllCategory();
    }

    @Override
    public PageInfo<TbCategory> findAll(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<TbCategory> data = findAll();
        //封装了整个分页任务的需求，包括分页所需要的总页数，总行数，当前行
        PageInfo<TbCategory> pagevo = new PageInfo<TbCategory>(data);
        System.out.println("总行数==>"+pagevo.getTotal());
        System.out.println("总页数==>"+pagevo.getPages());
        System.out.println("行==>"+pagevo.getList());
        return pagevo;
    }

    @Override
    public TbCategory findOne(int id) {
        return tbCategoryDAO.selectByPrimaryKey(id);
    }

    @Override
    public int insertCategory(TbCategory category) {
        return tbCategoryDAO.insertSelective(category);
    }

    @Override
    public int updateCategory(TbCategory category) {
        return tbCategoryDAO.updateByPrimaryKeySelective(category);
    }

    @Override
    public int deleteCategory(Integer code) {
        return tbCategoryDAO.deleteByPrimaryKey(code);
    }

    @Override
    public PageInfo<TbCategory> findByCodeOrCaption(int page, int rows,TbCategory category) {
        PageHelper.startPage(page, rows);
        List<TbCategory> data = tbCategoryDAO.findByCodeOrCaption(category);
        //封装了整个分页任务的需求，包括分页所需要的总页数，总行数，当前行
        PageInfo<TbCategory> pagevo = new PageInfo<TbCategory>(data);
        return pagevo;
    }

    @Override
    public String findByid(int code) {
        return tbCategoryDAO.findAllByid(code);
    }

}
