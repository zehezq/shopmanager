package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbAdminDAO;
import cn.edu.jxufe.entity.TbAdmin;
import cn.edu.jxufe.services.TbAdminServer;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * Created by Administrator on 2018/8/9.
 */
@Component
public class TbAdminServerImpl implements TbAdminServer{
    @Autowired
    private TbAdminDAO tbAdminDAO;

    @Override
    public List<TbAdmin> selectBypassword(@Param("map") Map<String, String> map) {
        return tbAdminDAO.selectBypassword(map);
    }

    @Override
    public List<TbAdmin> findAllAdmin() {
        return tbAdminDAO.findAllAdmin();
    }

    @Override
    public TbAdmin selectByap(TbAdmin tbAdmin) {
        return tbAdminDAO.selectByap(tbAdmin);
    }

    @Override
    public int insertTbadmin(TbAdmin tbAdmin) {
        return tbAdminDAO.insertSelective(tbAdmin);
    }

    @Override
    public TbAdmin selectByAccount(String account) {
        return tbAdminDAO.selectByPrimaryKey(account);
    }
}
/*
zouziqian
*/
