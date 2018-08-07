package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbAdvertisement;
import org.springframework.stereotype.Repository;

/**
 * TbAdvertisementDAO继承基类
 */
@Repository
public interface TbAdvertisementDAO extends MyBatisBaseDao<TbAdvertisement, Integer> {
}