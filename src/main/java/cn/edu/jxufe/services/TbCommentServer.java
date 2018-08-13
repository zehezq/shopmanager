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

    //删除通过id
    public int deleteByTbCommentId(int id);

    //增加
    public int insertTbComment(TbComment tbComment);

    //更新
    public int updateTbComment(TbComment tbComment);

}
/*
zouziqian
*/
