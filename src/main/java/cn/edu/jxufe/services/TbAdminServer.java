package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbAdmin;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/9.
 */
public interface TbAdminServer {
    public List<TbAdmin> selectBypassword(@Param("map") Map<String, String> map);
}
