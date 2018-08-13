package cn.edu.jxufe.services.impl;

import cn.edu.jxufe.dao.TbAdvertisementDAO;
import cn.edu.jxufe.entity.TbAdvertisement;
import cn.edu.jxufe.services.AdvertisementService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
@Service
public class AdvertisementServiceImpl implements AdvertisementService {

    @Autowired
    private TbAdvertisementDAO tbAdvertisementDAO;

    @Override
    public List<TbAdvertisement> findAll() {
        return tbAdvertisementDAO.findAllAds();
    }

    @Override
    public PageInfo<TbAdvertisement> findAll(int page, int rows) {
        PageHelper.startPage(page, rows);
        List<TbAdvertisement> data = findAll();
        //封装了整个分页任务的需求，包括分页所需要的总页数，总行数，当前行
        PageInfo<TbAdvertisement> pagevo = new PageInfo<TbAdvertisement>(data);
        System.out.println("总行数==>"+pagevo.getTotal());
        System.out.println("总页数==>"+pagevo.getPages());
        System.out.println("行==>"+pagevo.getList());
        return pagevo;
    }

    @Override
    public TbAdvertisement findOne(int id) {
        return tbAdvertisementDAO.selectByPrimaryKey(id);
    }

    @Override
    public int update(TbAdvertisement advertisement) {
        return tbAdvertisementDAO.updateByPrimaryKeySelective(advertisement);
    }

    @Override
    public int insert(TbAdvertisement advertisement) {
        return tbAdvertisementDAO.insertSelective(advertisement);
    }
}
