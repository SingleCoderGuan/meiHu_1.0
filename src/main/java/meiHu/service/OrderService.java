package meiHu.service;

import meiHu.entity.Order;

import java.util.List;

public interface OrderService {

    public void save(Order order);
    public List<Order> getOrderByUid(int uid);
    public int deleteOrderByOrderId(int orderid);


    //用户查询待付款的订单
    public List<Order> noPayOrder(int uid);
    //用户查询待发货的订单
    public List<Order> waitOrder(int uid);
    //用户查询已发货的订单
    public List<Order> getRunOrder(int uid);
    //用户查询已完成的订单
    public List<Order> getDoneOrder(int uid);
}
