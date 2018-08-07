package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbCollection;
import org.springframework.stereotype.Repository;

/**
 * TbCollectionDAO继承基类
 */
@Repository
public interface TbCollectionDAO extends MyBatisBaseDao<TbCollection, Integer> {
}