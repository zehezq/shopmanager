package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbOrder;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TbOrderDAO继承基类
 */
@Repository
public interface TbOrderDAO extends MyBatisBaseDao<TbOrder, Integer> {
    List<TbOrder> findAllOrder();

    //条件查询
    List<TbOrder> selectByUidOrStatus(TbOrder tbOrder);

}
