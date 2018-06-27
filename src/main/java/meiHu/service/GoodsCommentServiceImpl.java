package meiHu.service;

import meiHu.dao.ShopGoodsCommentMapper;
import meiHu.entity.ShopGoodsComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsCommentServiceImpl implements GoodsCommentService {
    @Autowired
    private ShopGoodsCommentMapper shopGoodsCommentMapper ;
    @Override
    public boolean insert(ShopGoodsComment comment) {
        return shopGoodsCommentMapper.insertComment(comment) ;
    }

    public boolean updateItemState(int goodid,int orderid){
        return shopGoodsCommentMapper.updateItem(goodid,orderid);
    }

    @Override
    public List<ShopGoodsComment> getCommentsByGid(int gid) {
        return shopGoodsCommentMapper.selectCommentsByGid(gid);
    }
}
