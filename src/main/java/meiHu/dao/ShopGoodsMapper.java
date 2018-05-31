package meiHu.dao;


import meiHu.entity.ShopGoods;

import java.util.List;

public interface ShopGoodsMapper {
    //根据商品名模糊查询商品

    public List<ShopGoods> selectGoodsByGoodsName(int goodsname);

    //根据类别查出该类别所有商品
    public List<ShopGoods> selectAllGoodByCategory();

    //查看商品详情
    public ShopGoods selectShopGoodsById(int shopgoodsid);


}