package cn.edu.jxufe.dao;

import cn.edu.jxufe.entity.TbGoods;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * TbGoodsDAO继承基类
 */
@Repository
public interface TbGoodsDAO extends MyBatisBaseDao<TbGoods, Integer> {
    /**
     *
     */
    List<TbGoods> findAllGoods();

    TbGoods selectByPrimaryKey(int id);

    List<TbGoods> findBySelect(TbGoods goods);

    List<TbGoods> findByCodeGoodid();
}