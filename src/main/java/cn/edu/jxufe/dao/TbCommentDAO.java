package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbComment;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TbCommentDAO继承基类
 */
@Repository
public interface TbCommentDAO extends MyBatisBaseDao<TbComment, Integer> {
    List<TbComment> findAllComment();

    //查询通过id
    TbComment selectByPrimaryKey(int id);

    List<TbComment> selectByUidOrGid(TbComment tbComment);

}