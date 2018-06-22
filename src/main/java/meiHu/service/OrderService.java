package meiHu.service;

import com.github.pagehelper.PageInfo;

import meiHu.entity.Order;
import meiHu.entity.OrderItem;

import java.util.List;
import java.util.Map;

public interface OrderService {

    public void save(Order order);
    public List<Order> getOrderByUid(int uid);
    public int deleteOrderByOrderId(int orderid);

    //用户查询待付款的订单
    public List<Order> noPayOrder(int uid);
    //用户查询待发货的订单
    public List<Order> waitOrder(int uid);
    //用户查询待收货的订单
    public List<Order> getRunOrder(int uid);
    //用户查询已完成的订单
    public List<Order> getDoneOrder(int uid);
    //根据订单编号查询订单信息
    public Order selectOrderById(int orderid);
    //根据订单详情编号查询订单详情信息
    public OrderItem selectOrderItemById(int itemid);
    //完善订单地址信息
    public int addAddrIntoOrderById(int orderid, String addressdetail, String receivename, String receivetel);
    //修改订单状态待付款为待发货
    public void updateOrderState(int orderid);
    //查看所有的订单信息
    public List<Order> selectYiFuKuanOrderLists();
    //分页查看所有信息
    public PageInfo<Order> selectYiFuKuanOrderListsByPage(Map<String, Object> map);

    //查看订单详情
    public Order selectYiFuKuanOrderItemLists(int orderid);
    //为订单安排发货
    public int updateOrderStateWeiFaHuo(int orderid);
    //修改订单状态为已完成
    public int updateOrderStateWeiWanCheng(int orderid);
    //查询不同状态的订单
    public List<Order> selectOrderByState(String state);
    //分页
    public PageInfo<Order> getAllOrderByPage(int uid, Map<String, Object> map);
}
