package meiHu.dao;

import meiHu.entity.ShopGoodsComment;

import java.util.List;

public interface ShopGoodsCommentMapper {

    public List<ShopGoodsComment> selectCommentsByGid(int gid) ;

    public boolean insertComment(ShopGoodsComment shopGoodsComment);

    public boolean updateItem(int goodid, int orderid);

}
