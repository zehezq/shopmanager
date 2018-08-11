package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbCategory;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TbCategoryDAO继承基类
 */
@Repository
public interface TbCategoryDAO extends MyBatisBaseDao<TbCategory, Integer> {
    List<TbCategory> findAllCategory();

    int insertSelective(TbCategory category);

    TbCategory selectByPrimaryKey(int id);
}