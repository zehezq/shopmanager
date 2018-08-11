package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbAdvertisement;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TbAdvertisementDAO继承基类
 */
@Repository
public interface TbAdvertisementDAO extends MyBatisBaseDao<TbAdvertisement, Integer> {
    List<TbAdvertisement> findAllAds();
    TbAdvertisement selectByPrimaryKey(int id);

}