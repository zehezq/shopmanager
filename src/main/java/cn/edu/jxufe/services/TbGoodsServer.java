package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbGoods;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
public interface TbGoodsServer {
    public List<TbGoods> findAllGoods();
}
