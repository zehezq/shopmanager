package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbUser;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TbUserDAO继承基类
 */
@Repository
public interface TbUserDAO extends MyBatisBaseDao<TbUser, Integer> {
    List<TbUser> findAllUser();

    TbUser selectByphone(String phone);

    List<TbUser> selectByNameAndPhone(TbUser tbUser);

}