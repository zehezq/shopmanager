package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbAddress;
import org.springframework.stereotype.Repository;

/**
 * TbAddressDAO继承基类
 */
@Repository
public interface TbAddressDAO extends MyBatisBaseDao<TbAddress, Integer> {
}