package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbAdmin;

/**
 * Created by Administrator on 2018/8/9.
 */
public interface TbAdminServer {
    public TbAdmin selectBypassword(TbAdmin tbAdmin);

}
