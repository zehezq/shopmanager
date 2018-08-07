package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbOrderdetail;
import org.springframework.stereotype.Repository;

/**
 * TbOrderdetailDAO继承基类
 */
@Repository
public interface TbOrderdetailDAO extends MyBatisBaseDao<TbOrderdetail, Integer> {
}