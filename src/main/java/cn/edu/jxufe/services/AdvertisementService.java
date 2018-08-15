package cn.edu.jxufe.services;

import cn.edu.jxufe.entity.TbAdvertisement;
import com.github.pagehelper.PageInfo;

import java.util.List;

/**
 * Created by Administrator on 2018/8/8.
 */
public interface AdvertisementService {
    List<TbAdvertisement> findAll();

    PageInfo<TbAdvertisement> findAll(int page, int rows);

    TbAdvertisement findOne(int id);

    int update(TbAdvertisement advertisement);

    int insert(TbAdvertisement advertisement);

    int deleteAds(int adno);
}
