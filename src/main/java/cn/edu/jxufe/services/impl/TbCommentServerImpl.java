package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbCommentDAO;
import cn.edu.jxufe.entity.TbComment;
import cn.edu.jxufe.services.TbArticleServer;
import cn.edu.jxufe.services.TbCommentServer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
@Component
public class TbCommentServerImpl implements TbCommentServer{
    @Autowired
    private TbCommentDAO tbCommentDAO;
    @Override
    public List<TbComment> findAllComment() {
        return tbCommentDAO.findAllComment();
    }

    @Override
    public PageInfo<TbComment> findAllComment(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<TbComment> data=findAllComment();
        //封装了整个分页业务的需求，包括分页所需要的总页数，总行数，当前行
        PageInfo<TbComment> pageInfo=new PageInfo(data);
        System.out.println("总行数："+pageInfo.getTotal());
        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("数据内容："+pageInfo.getList());
        return pageInfo;
    }

    //条件查询
    @Override
    public PageInfo<TbComment> selectByUidOrGid(int page, int rows, TbComment tbComment) {
        PageHelper.startPage(page,rows);
        List<TbComment> data=tbCommentDAO.selectByUidOrGid(tbComment);
        //封装了整个分页业务的需求，包括分页所需要的总页数，总行数，当前行
        PageInfo<TbComment> pageInfo =new PageInfo<TbComment>(data);
        System.out.println("总行数："+pageInfo.getTotal());
        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("数据内容："+pageInfo.getList());
        return pageInfo;
    }

    @Override
    public TbComment selectByPrimaryKey(int id) {
        return tbCommentDAO.selectByPrimaryKey(id);
    }

    @Override
    public int deleteByTbCommentId(int id) {
        return tbCommentDAO.deleteByPrimaryKey(id);
    }

    @Override
    public int insertTbComment(TbComment tbComment) {
        return tbCommentDAO.insertSelective(tbComment);
    }

    @Override
    public int updateTbComment(TbComment tbComment) {
        return tbCommentDAO.updateByPrimaryKeySelective(tbComment);
    }

}
/*
zouziqian
*/
