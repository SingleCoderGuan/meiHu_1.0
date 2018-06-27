package meiHu.dao;


import meiHu.entity.Favor;


import java.util.List;

public interface FavorGoodMapper {

    //用户对某种商品的收藏
    public int addCollectionByUidAndGoodid(int uid, int goodid);

    //根据用户id查询我的收藏信息
    public List<Favor> findMyFavor(int uid);

    //查询该商品是否已经被该用户收藏过
    public Favor selectIfCollection(int uid, int goodid);

    //用户对商品取消收藏
    public int deleteCollectionByUidAndGoodid(int uid, int goodid);

}
