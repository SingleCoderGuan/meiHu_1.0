package meiHu.dao;

import meiHu.entity.GoodsCategory;

import java.util.List;

public interface GoodsCategoryMapper {
    //查询商品的所有类别
    public List<GoodsCategory> getAllGoodsCategory();

}

