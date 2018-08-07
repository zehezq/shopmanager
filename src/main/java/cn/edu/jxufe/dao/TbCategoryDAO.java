package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbCategory;
import org.springframework.stereotype.Repository;

/**
 * TbCategoryDAO继承基类
 */
@Repository
public interface TbCategoryDAO extends MyBatisBaseDao<TbCategory, Integer> {
}