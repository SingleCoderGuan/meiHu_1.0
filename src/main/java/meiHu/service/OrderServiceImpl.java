package meiHu.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import meiHu.dao.OrderMapper;
import meiHu.entity.Goods;
import meiHu.entity.Order;
import meiHu.entity.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

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
    public List<Order> noPayOrder(int uid) {
        return orderMapper.noPayOrder(uid);
    }

    @Override
    public List<Order> waitOrder(int uid) {
        return orderMapper.waitOrder(uid);
    }

    @Override
    public List<Order> getRunOrder(int uid) {
        return orderMapper.getRunOrder(uid);
    }

    @Override
    public List<Order> getDoneOrder(int uid) {
        return orderMapper.getDoneOrder(uid);
    }

    @Override
    public Order selectOrderById(int orderid) {
        return orderMapper.showOrderById(orderid);
    }

    @Override
    public OrderItem selectOrderItemById(int itemid) {
        return orderMapper.showOrderItemById(itemid);
    }

    @Override
    public int addAddrIntoOrderById(int orderid,String addressdetail,String receivename,String receivetel) {
        if(orderMapper.addAddrInfoIntoOrderById(orderid,addressdetail,receivename,receivetel)==1){
            return 1;
        }else{
            return 0;
        }
    }

    @Override
    public void updateOrderState(int orderid) {
        orderMapper.updateOrderState(orderid);
    }

    @Override
    public List<Order> selectYiFuKuanOrderLists() {
        return orderMapper.selectYiFuKuanOrderLists();
    }

    @Override
    public PageInfo<Order> selectYiFuKuanOrderListsByPage(Map<String, Object> map) {
        int curPage= (int) map.get("curPage");
        //查询的条数
        int pageSize=(int)map.get("pageSize");

        PageHelper.startPage(curPage,pageSize);


        List<Order> postList =orderMapper.selectYiFuKuanOrderLists();
        PageInfo<Order> pageInfo=new PageInfo<>(postList);
        return  pageInfo ;

    }

    @Override
    public Order selectYiFuKuanOrderItemLists(int orderid) {
        return orderMapper.selectYiFuKuanOrderItem(orderid);
    }

    @Override
    public int updateOrderStateWeiFaHuo(int orderid) {
        if(orderMapper.updateOrderStateWeiFaHuo(orderid)==1){
            return 1;
        }else{
            return 0;
        }
    }

    @Override
    public int updateOrderStateWeiWanCheng(int orderid) {
        if(orderMapper.updateOrderStateWeiWanCheng(orderid)==1){
            return 1;
        }else{
            return 0;
        }
    }

    @Override
    public List<Order> selectOrderByState(String state) {
        return orderMapper.showOrderByState(state);
    }


    @Override
    public PageInfo<Order> getAllOrderByPage(int uid, Map<String, Object> map) {
        int curPage= (int) map.get("curPage");
        //查询的条数
        int pageSize=(int)map.get("pageSize");

        PageHelper.startPage(curPage,pageSize);


        List<Order> postList =orderMapper.findMyOrders(uid);
        PageInfo<Order> pageInfo=new PageInfo<>(postList);
        return  pageInfo ;
    }

    @Override
    public List<Order> selectOrderByName(String goodname) {
        return orderMapper.selectOrderByName(goodname);
    }
}
