package meiHu.service;

import meiHu.dao.GoodsMapper;
import meiHu.entity.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodServiceImpl implements GoodService {

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public List<Goods> getGoods(int categoryid) {

        return goodsMapper.getGoods(categoryid);
    }

    @Override
    public Goods getGood(int id) {

        return goodsMapper.getGood(id);
    }

    @Override
    public List<Goods> selectGoodsBySales(int categoryid) {
        return goodsMapper.selectGoodsBySales(categoryid);
    }

  /*  @Override
    public List<Goods> getProducts() {
        return goodsMapper.getProducts();
    }*/
}

