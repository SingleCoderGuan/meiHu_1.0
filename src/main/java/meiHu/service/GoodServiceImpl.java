package meiHu.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import meiHu.dao.GoodsMapper;
import meiHu.entity.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
    public int getCategoryByGid(int gid) {

        return goodsMapper.getCategoryByGid(gid);
    }

    @Override
    public List<Goods> showHotSale(int categoryId) {
        return goodsMapper.getHotSaleGood(categoryId);
    }

    @Override
    public List<Goods> showRecommend(int categoryId) {
        return goodsMapper.getRecommendGood(categoryId);
    }


    @Override
    public int selectCategoryByGoodid(int goodid) {
        return goodsMapper.selectCategoryByGoodid(goodid);
    }


    @Override
    public PageInfo<Goods> getGoodsByCategory(int categoryid, Map<String, Object> map) {
        int curPage1= (int) map.get("curPage1");
        //查询的条数
        int pageSize=(int)map.get("pageSize");

        PageHelper.startPage(curPage1,pageSize);


        List<Goods> postList =goodsMapper.getGoods(categoryid);
        PageInfo<Goods> pageInfo=new PageInfo<>(postList);
        return  pageInfo ;
    }

    @Override
    public List<Goods> getAllProducts() {
        return goodsMapper.getAllProducts();
    }

    @Override
    public PageInfo<Goods> getAllProductByPage(Map<String, Object> map) {
        int curPage= (int) map.get("curPage");
        //查询的条数
        int pageSize=(int)map.get("pageSize");

        PageHelper.startPage(curPage,pageSize);


        List<Goods> postList =goodsMapper.getAllProducts() ;
        PageInfo<Goods> pageInfo=new PageInfo<>(postList);
        return  pageInfo ;

    }


    @Override
    public boolean insertGoods(Goods goods) {
        return goodsMapper.insertGoods(goods);
    }


    @Override
    public boolean updateGood(Goods goods) {
        return goodsMapper.updateGood(goods);
    }

    @Override
    public boolean deleteGood(int goodid) {
        return goodsMapper.deleteGood(goodid);
    }


}
