package meiHu.service;

import meiHu.entity.Goods;

import java.util.List;

public interface GoodService {

    public List<Goods> getGoods(int categoryid);

    public Goods getGood(int id);

   /* public List<Goods> getProducts();*/
   //根据商品类别的id通过商品销量降序排列
   public List<Goods> selectGoodsBySales(int categoryid);
}
