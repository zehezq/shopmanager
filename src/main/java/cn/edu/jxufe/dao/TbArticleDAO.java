package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbArticle;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TbArticleDAO继承基类
 */
@Repository
public interface TbArticleDAO extends MyBatisBaseDao<TbArticle, Integer> {
    List<TbArticle> findAllArticle();

    //查询通过id
    TbArticle selectByPrimaryKey(int id);
}