package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbOrder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TbOrderDAO继承基类
 */
@Repository
public interface TbOrderDAO extends MyBatisBaseDao<TbOrder, String> {
    List<TbOrder> findAllOrder();

    //查询通过id
    TbOrder selectByPrimaryKey(String id);
}