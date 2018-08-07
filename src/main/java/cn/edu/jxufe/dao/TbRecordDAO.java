package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbRecord;
import org.springframework.stereotype.Repository;

/**
 * TbRecordDAO继承基类
 */
@Repository
public interface TbRecordDAO extends MyBatisBaseDao<TbRecord, Integer> {
}