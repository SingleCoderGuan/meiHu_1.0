package meiHu.service;

import com.github.pagehelper.PageInfo;
import meiHu.entity.Goods;

import java.util.List;
import java.util.Map;

public interface GoodService {

    public List<Goods> getGoods(int categoryid);

    public Goods getGood(int id);

    public int getCategoryByGid(int gid);

    public List<Goods> showHotSale(int categoryId);

    public List<Goods> showRecommend(int categoryId);


    public PageInfo<Goods> getGoodsByCategory(int categoryid, Map<String, Object> map);
    //根据goodid判断该商品属于哪类商品
    public int selectCategoryByGoodid(int goodid);
    //管理员查看所有商品
    public List<Goods> getAllProducts();
    public PageInfo<Goods> getAllProductByPage(Map<String, Object> map);
    //管理员添加商品，商品上架
    public boolean insertGoods(Goods goods);

    //管理员更新商品信息
    public boolean updateGood(Goods goods);

    //管理员通过id删除商品
    public boolean deleteGood(int goodid);
}
