package meiHu.service;

import meiHu.entity.Goods;

import java.util.List;

public interface GoodService {

    public List<Goods> getGoods(int categoryid);

    public Goods getGood(int id);

   /* public List<Goods> getProducts();*/
}
