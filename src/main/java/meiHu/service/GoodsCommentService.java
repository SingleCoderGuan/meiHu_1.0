package meiHu.service;

import meiHu.entity.ShopGoodsComment;

import java.util.List;

public interface GoodsCommentService {
    public boolean insert(ShopGoodsComment comment) ;
    public boolean updateItemState(int gid,int orderid) ;

    public List<ShopGoodsComment> getCommentsByGid(int gid);
}
