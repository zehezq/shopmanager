package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbGoodsDAO;
import cn.edu.jxufe.entity.TbGoods;
import cn.edu.jxufe.services.GoodsInfoService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/8/7.
 */
@Service
public class GoodsInfoServiceImpl implements GoodsInfoService {
    @Autowired
    private TbGoodsDAO tbGoodsDAO;

    @Override
    public List<TbGoods> findAll() {
        return tbGoodsDAO.findAllGoods();
    }


    @Override
    public PageInfo<TbGoods> findAll(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<TbGoods> data = findAll();
        //封装了整个分页任务的需求，包括分页所需要的总页数，总行数，当前行
        PageInfo<TbGoods> pagevo = new PageInfo<TbGoods>(data);
        System.out.println("总行数==>"+pagevo.getTotal());
        System.out.println("总页数==>"+pagevo.getPages());
        System.out.println("行==>"+pagevo.getList());
        return pagevo;
    }

    @Override
    public TbGoods findOne(int id) {
        return tbGoodsDAO.selectByPrimaryKey(id);
    }

    @Override
    public int updateGoods(TbGoods goods) {
        return tbGoodsDAO.updateByPrimaryKeySelective(goods);
    }

    @Override
    public int insertGoods(TbGoods goods) {
        return tbGoodsDAO.insertSelective(goods);
    }

    @Override
    public int deleteGoods(int goodid) {
        return tbGoodsDAO.deleteByPrimaryKey(goodid);
    }

    @Override
    public PageInfo<TbGoods> findBySelect(int page, int rows,TbGoods goods) {
        PageHelper.startPage(page, rows);
        List<TbGoods> data = tbGoodsDAO.findBySelect(goods);
        PageInfo<TbGoods> pagevo = new PageInfo<TbGoods>(data);
        return pagevo;
    }

    @Override
    public List<TbGoods> findBySelect2(TbGoods goods) {
        return tbGoodsDAO.findBySelect(goods);
    }

}

