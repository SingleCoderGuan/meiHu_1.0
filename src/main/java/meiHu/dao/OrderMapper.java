package meiHu.dao;


import meiHu.entity.Order;
import meiHu.entity.OrderItem;

import java.util.List;

public interface OrderMapper {

    //保存订单信息
    public void save(Order order);
    //保存订单信息的同时，向shop_item中插入多条信息
    public void saveItem(OrderItem oi);
    //根据用户id查询我的订单信息
    public List<Order> findMyOrders(int uid);
    //用户取消订单
    //先删除item表中的数据
    public void deleteOrderItem(int orderid);
    //删除order中对应的订单
    public void deleteOrder(int orderid);
    //用户查询待付款的订单
    public List<Order> noPayOrder(int uid);
    //用户查询待发货的订单
    public List<Order> waitOrder(int uid);
    //用户查询待收货的订单
    public List<Order> getRunOrder(int uid);
    //用户查询已完成的订单
    public List<Order> getDoneOrder(int uid);
    //根据订单编号查询订单信息
    public Order showOrderById(int orderid);
    //根据订单详情编号查询订单详情信息
    public OrderItem showOrderItemById(int itemid);

    /*//根据商品编号查询该商品所属的订单详情编号
    public int selectItemIdByGid(int goodid);*/

    //用户提交退款信息，修改商品详情表中的状态
    public int updateOrderItemState(int itemid);
    //管理员同意退款，更改相应订单详情的退款的状态
    public int updateAfterOrderItemState(int itemid);
    //用户结算时，根据订单编号插入地址信息，完善订单信息
    public int addAddrInfoIntoOrderById(int orderid, String addressdetail, String receivename, String receivetel);
    //修改订单状态待付款为待发货
    public void updateOrderState(int orderid);
    //管理员查询所有订单
    public List<Order> selectYiFuKuanOrderLists();
    //管理员查询待发货，已发货的订单详情信息
    public Order selectYiFuKuanOrderItem(int orderid);
    //为订单安排发货，修改订单状态待发货为待收货
    public int updateOrderStateWeiFaHuo(int orderid);
    //修改订单状态待收货为已完成
    public int updateOrderStateWeiWanCheng(int orderid);
    //查询各种状态的订单
    public List<Order> showOrderByState(String state);
    // 根据订单编号查询地址信息为空
    public String selectAddressByOid(int orderid);
}
