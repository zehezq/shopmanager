package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbAdmin;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * TbAdminDAO继承基类
 */
@Repository
public interface TbAdminDAO extends MyBatisBaseDao<TbAdmin, String> {
    List<TbAdmin> selectBypassword(@Param("map") Map<String, String> map);

    TbAdmin selectByap(TbAdmin tbAdmin);

    List<TbAdmin> findAllAdmin();

}