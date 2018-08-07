package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbUser;
import org.springframework.stereotype.Repository;

/**
 * TbUserDAO继承基类
 */
@Repository
public interface TbUserDAO extends MyBatisBaseDao<TbUser, Integer> {
}