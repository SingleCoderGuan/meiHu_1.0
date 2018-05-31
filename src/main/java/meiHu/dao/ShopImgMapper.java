package meiHu.dao;



import meiHu.entity.ShopImg;

import java.util.List;

public interface ShopImgMapper {
    //    根据商品id查询出该商品的所有图片
    public List<ShopImg> selectAllImgById(int shopgoodsid);
}