package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbAdminDAO;
import cn.edu.jxufe.entity.TbAdmin;
import cn.edu.jxufe.services.TbAdminServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * Created by Administrator on 2018/8/9.
 */
@Component
public class TbAdminServerImpl implements TbAdminServer{
    @Autowired
    private TbAdminDAO tbAdminDAO;

    @Override
    public TbAdmin selectBypassword(TbAdmin tbAdmin){
        return tbAdminDAO.selectBypassword(tbAdmin);
    }
}
/*
zouziqian
*/
