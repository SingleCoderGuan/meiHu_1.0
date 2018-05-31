package meiHu.dao;




import meiHu.entity.ShopItem;
import meiHu.entity.ShopOrder;

import java.util.List;

public interface ShopOrderMapper {
//       查看某用户所有订单
    public List<ShopOrder> selectAllOrderByUid(int uid);

    //修改订单状态
    public boolean updateOrderState(int orderid);


    //查询该订单下所有商品
    public List<ShopItem> selectAllGoodsByOrderid(int orderid);
}