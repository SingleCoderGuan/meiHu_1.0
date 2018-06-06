package meiHu.dao;


import meiHu.entity.Goods;

import java.util.List;

public interface GoodsMapper {

    //根据类别id，分类查询商品
    public List<Goods> getGoods(int categoryid);
    //根据商品id，查询商品详情
    public Goods getGood(int id);
    //查询全部商品信息
    //public List<Goods> getProducts();

}
