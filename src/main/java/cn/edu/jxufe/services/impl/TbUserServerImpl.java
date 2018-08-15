package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbUserDAO;
import cn.edu.jxufe.entity.TbUser;
import cn.edu.jxufe.services.TbUserServer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
@Component
public class TbUserServerImpl implements TbUserServer {
    @Autowired
    private TbUserDAO tbUserDAO;
    @Override
    public List<TbUser> findAllUser() {
        return tbUserDAO.findAllUser();
    }

    @Override
    public PageInfo<TbUser> findAllUser(int page, int rows) {
        PageHelper.startPage(page,rows);
        List<TbUser> data=findAllUser();
        //封装了整个分页业务的需求，包括分页所需要的总页数，总行数，当前行
        PageInfo<TbUser> pageInfo=new PageInfo(data);
        System.out.println("总行数："+pageInfo.getTotal());
        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("数据内容："+pageInfo.getList());
        return pageInfo;
    }

    @Override
    public TbUser selectByUserId(int id) {
        return tbUserDAO.selectByPrimaryKey(id);
    }

    @Override
    public int deleteByUserId(int id) {
        return tbUserDAO.deleteByPrimaryKey(id);
    }

    @Override
    public int insertTbuser(TbUser tbUser) {
        return tbUserDAO.insertSelective(tbUser);
    }

    @Override
    public int updateTbuser(TbUser tbUser) {
        return tbUserDAO.updateByPrimaryKeySelective(tbUser);
    }

    @Override
    public TbUser selectByphone(String phone) {
        return tbUserDAO.selectByphone(phone);
    }

}
/*
zouziqian
*/
