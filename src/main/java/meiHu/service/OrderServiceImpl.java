package meiHu.service;

import meiHu.dao.OrderMapper;
import meiHu.entity.Order;
import meiHu.entity.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Override
    public void save(Order order) {

        orderMapper.save(order);

        for(OrderItem oi:order.getItems()){
            orderMapper.saveItem(oi);
        }

    }

    @Override
    public List<Order> getOrderByUid(int uid) {

        return orderMapper.findMyOrders(uid);
    }

    @Override
    public int deleteOrderByOrderId(int orderid) {
        int result=0;
        if(orderid==0){
            result=-1;
        }else {
            orderMapper.deleteOrderItem(orderid);
            orderMapper.deleteOrder(orderid);
            result=1;
        }
        return result;
    }

    @Override
    public List<Order> getRunOrder(int uid) {
        /*orderMapper.getRunOrder(uid);

        for(OrderItem oi:order.getItems()){
            orderMapper.saveItem(oi);
        }*/
        return orderMapper.getRunOrder(uid);
    }

    @Override
    public List<Order> getDoneOrder(int uid) {

        return orderMapper.getDoneOrder(uid);
    }


}
