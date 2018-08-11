package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbCategory;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
public interface CategoryService {
    List<TbCategory> findAll();

    PageInfo<TbCategory> findAll(int page, int rows);

    TbCategory findOne(int id);

    int insertCategory(TbCategory category);


}
