package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbArticle;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
public interface TbArticleServer {
    public List<TbArticle> findAllArticle();

    //分页
    public PageInfo<TbArticle> findAllArticle(int page,int rows);

    public TbArticle selectByPrimaryKey(int id);

    //删除通过id
    public int deleteByTbArticleId(int id);

    //增加
    public int insertTbArticle(TbArticle tbArticle);

    //更新
    public int updateTbArticle(TbArticle tbArticle);
}
/*
zouziqian
*/
