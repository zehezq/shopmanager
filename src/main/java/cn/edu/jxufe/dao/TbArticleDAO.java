package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbArticle;
import org.springframework.stereotype.Repository;

/**
 * TbArticleDAO继承基类
 */
@Repository
public interface TbArticleDAO extends MyBatisBaseDao<TbArticle, Integer> {
}