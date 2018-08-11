package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbComment;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
public interface TbCommentServer {
    public List<TbComment> findAllComment();

    //分页
    public PageInfo<TbComment> findAllComment(int page,int rows);

    public TbComment selectByPrimaryKey(int id);
}
/*
zouziqian
*/
