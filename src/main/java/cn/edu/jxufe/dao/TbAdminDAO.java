package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbAdmin;
import org.springframework.stereotype.Repository;

/**
 * TbAdminDAO继承基类
 */
@Repository
public interface TbAdminDAO extends MyBatisBaseDao<TbAdmin, String> {
}