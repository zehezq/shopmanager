package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbArticleDAO;
import cn.edu.jxufe.entity.TbArticle;
import cn.edu.jxufe.services.TbArticleServer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
@Component
public class TbArticleServerImpl implements TbArticleServer{
    @Autowired
    private TbArticleDAO tbArticleDAO;
    @Override
    public List<TbArticle> findAllArticle() {
        return tbArticleDAO.findAllArticle();
    }

    @Override
    public PageInfo<TbArticle> findAllArticle(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<TbArticle> data=findAllArticle();
        //封装了整个分页业务的需求，包括分页所需要的总页数，总行数，当前行
        PageInfo<TbArticle> pageInfo=new PageInfo(data);
        System.out.println("总行数："+pageInfo.getTotal());
        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("数据内容："+pageInfo.getList());
        return pageInfo;
    }

    @Override
    public TbArticle selectByPrimaryKey(int id) {
        return tbArticleDAO.selectByPrimaryKey(id);
    }

    @Override
    public int deleteByTbArticleId(int id) {
        return tbArticleDAO.deleteByPrimaryKey(id);
    }

    @Override
    public int insertTbArticle(TbArticle tbArticle) {
        return tbArticleDAO.insert(tbArticle);
    }

    @Override
    public int updateTbArticle(TbArticle tbArticle) {
        return tbArticleDAO.updateByPrimaryKeySelective(tbArticle);
    }
}
/*
zouziqian
*/
