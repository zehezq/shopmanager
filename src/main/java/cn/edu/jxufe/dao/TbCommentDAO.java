package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbComment;
import org.springframework.stereotype.Repository;

/**
 * TbCommentDAO继承基类
 */
@Repository
public interface TbCommentDAO extends MyBatisBaseDao<TbComment, Integer> {
}