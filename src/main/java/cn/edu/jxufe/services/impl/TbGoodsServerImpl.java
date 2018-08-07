package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbGoodsDAO;
import cn.edu.jxufe.entity.TbGoods;
import cn.edu.jxufe.services.TbGoodsServer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by Administrator on 2018/8/7.
 */
@Component
public class TbGoodsServerImpl implements TbGoodsServer {
    @Autowired
    private TbGoodsDAO tbGoodsDAO;

    @Override
    public List<TbGoods> findAllGoods() {
        return tbGoodsDAO.findAllGoods();
    }
}
/*
zouziqian
*/
