package meiHu.dao;


import meiHu.entity.Goods;

import java.util.List;

public interface GoodsMapper {

    //根据类别id，分类查询商品
    public List<Goods> getGoods(int categoryid);
    //根据商品id，查询商品详情
    public Goods getGood(int id);
    //根据商品id,查询商品所属商品分类编号
    public int getCategoryByGid(int gid);
    //根据商品编号按照销量排序显示热卖商品信息
    public List<Goods> getHotSaleGood(int categoryId);
    //根据商品编号按照库存量排序显示推荐商品信息
    public List<Goods> getRecommendGood(int categoryId);
    //根据goodid判断该商品属于哪类商品
    public int selectCategoryByGoodid(int goodid);


    //管理员查看所有商品
    public List<Goods> getAllProducts();
    //管理员添加商品，商品上架
    public boolean insertGoods(Goods goods);
    //管理员更新商品信息
    public boolean updateGood(Goods goods);
    //管理员通过商品id对商品下架处理
    public boolean deleteGood(int goodid);

    public List<Goods> selectRecommendList() ;

}
