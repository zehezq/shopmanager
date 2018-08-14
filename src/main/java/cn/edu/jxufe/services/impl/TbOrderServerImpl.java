package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbGoodsDAO;
import cn.edu.jxufe.dao.TbOrderDAO;
import cn.edu.jxufe.entity.TbGoods;
import cn.edu.jxufe.entity.TbOrder;
import cn.edu.jxufe.services.TbOrderServer;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/8/7.
 */
@Component
public class TbOrderServerImpl implements TbOrderServer {
    @Autowired
    private TbOrderDAO tbOrderDAO;

    @Override
    public List<TbOrder> findAllOrder() {
        return tbOrderDAO.findAllOrder();
    }

    @Override
    public PageInfo<TbOrder> findAllOrder(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<TbOrder> data=findAllOrder();
        //封装了整个分页业务的需求，包括分页所需要的总页数，总行数，当前行
        PageInfo<TbOrder> pageInfo=new PageInfo(data);
        System.out.println("总行数："+pageInfo.getTotal());
        System.out.println("总页数："+pageInfo.getPages());
        System.out.println("数据内容："+pageInfo.getList());
        return pageInfo;
    }

    @Override
    public TbOrder selectByPrimaryKey(String id) {
        return tbOrderDAO.selectByPrimaryKey(id);
    }

    @Override
    public int deleteByOrderId(String id) {
        return tbOrderDAO.deleteByPrimaryKey(id);
    }

    @Override
    public int insertOrder(TbOrder tbOrder) {
        return tbOrderDAO.insertSelective(tbOrder);
    }

    @Override
    public int updateOrder(TbOrder tbOrder) {
        return tbOrderDAO.updateByPrimaryKeySelective(tbOrder);
    }
}
/*
zouziqian
*/
