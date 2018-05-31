package meiHu.dao;


import meiHu.entity.ShopDrawback;

import java.util.List;

public interface ShopDrawbackMapper {
    //添加退款商品(参数:订单号)
    public boolean addDrawBack(int orderid);
//    删除退款信息
    public boolean deleteDrawBack(int drawbackid);

    //查询某用户所有退款信息
    public List<ShopDrawback> selectAllDrawBackByUser(int uid);

    //修改退款状态
    public boolean updateDrawBackState(int drawbackid);

}