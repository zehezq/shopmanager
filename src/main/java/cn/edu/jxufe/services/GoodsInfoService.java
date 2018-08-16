package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbGoods;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/8/7.
 */

public interface GoodsInfoService {
    public List<TbGoods> findAll();

    PageInfo<TbGoods> findAll(int page, int rows);

    TbGoods findOne(int id);

    int updateGoods(TbGoods goods);

    int insertGoods(TbGoods goods);

    int deleteGoods(int goodid);

    public PageInfo<TbGoods> findBySelect(int page, int rows,TbGoods goods);

    public List<TbGoods> findBySelect2(TbGoods goods);
}

