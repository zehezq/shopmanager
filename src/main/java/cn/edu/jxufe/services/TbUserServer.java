package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbUser;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
public interface TbUserServer {
    public List<TbUser> findAllUser();

    //分页
    public PageInfo<TbUser> findAllUser(int page,int rows);

    public TbUser selectByUserId(int id);

    //删除通过id
    public int deleteByUserId(int id);

    //增加
    public int insertTbuser(TbUser tbUser);

    //更新
    public int updateTbuser(TbUser tbUser);
}
/*
zouziqian
*/
