package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbOrder;
import org.springframework.stereotype.Repository;

/**
 * TbOrderDAO继承基类
 */
@Repository
public interface TbOrderDAO extends MyBatisBaseDao<TbOrder, String> {
}