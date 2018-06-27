package meiHu.service;


import meiHu.entity.Favor;

import java.util.List;


public interface FavorGoodService {

    //用户对某种商品的收藏
    public boolean addCollectionByUidAndGoodid(int uid, int goodid);


   //根据用户id查询我的收藏信息
    public List<Favor> findMyFavorByUid(int uid);
    //查询该帖子是否已经被该用户收藏过
    public Favor selectIfCollection(int uid, int goodid);

    //用户对商品取消收藏
    public boolean deleteCollectionByUidAndGoodid(int uid, int goodid);


}
