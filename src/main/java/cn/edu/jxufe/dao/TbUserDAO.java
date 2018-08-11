package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbUser;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TbUserDAO继承基类
 */
@Repository
public interface TbUserDAO extends MyBatisBaseDao<TbUser, Integer> {
    List<TbUser> findAllUser();

    //查询通过id
    //TbUser selectByPrimaryKey(int id);

    //删除通过id
    //int deleteByPrimaryKey(int id);

}