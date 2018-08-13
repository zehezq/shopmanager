package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbGoods;
import cn.edu.jxufe.entity.TbOrder;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/8/7.
 */

public interface TbOrderServer {
    public List<TbOrder> findAllOrder();

    //分页
    public PageInfo<TbOrder> findAllOrder(int page,int rows);

    public TbOrder selectByPrimaryKey(String id);

    //删除通过id
    public int deleteByOrderId(String id);

    //增加
    public int insertOrder(TbOrder tbOrder);

    //更新
    public int updateOrder(TbOrder tbOrder);
}
/*
zouziqian
*/
