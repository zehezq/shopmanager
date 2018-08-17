package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbAdmin;
import cn.edu.jxufe.entity.TbUser;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/9.
 */
public interface TbAdminServer {
    public List<TbAdmin> selectBypassword(@Param("map") Map<String, String> map);

    List<TbAdmin> findAllAdmin();

    TbAdmin selectByap(TbAdmin tbAdmin);

    int insertTbadmin(TbAdmin tbAdmin);

    TbAdmin selectByAccount(String account);
}
