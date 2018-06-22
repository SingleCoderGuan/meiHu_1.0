package meiHu.service;

import meiHu.dao.OrderMapper;
import meiHu.dao.RefundOrderMapper;
import meiHu.entity.RefundOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RefundOrderServiceImpl implements RefundOrderService{

    @Autowired
    private RefundOrderMapper refundOrderMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Override
    public  int insertDrawbackInfo(RefundOrder ro,int itemid) {
        if(refundOrderMapper.addDrawbackInfo(ro)==1 && orderMapper.updateOrderItemState(itemid)==1){
             return 1;
         }else{
             return 0;
         }
    }

    @Override
    public List<RefundOrder> selectDrawbackInfo() {
        return refundOrderMapper.showAllDrawbackInfo();
    }

    @Override
    public int updateDrawbackInfo(int drawbackid,int itemid) {
        if(refundOrderMapper.updateDrawbackState(drawbackid)==1 && orderMapper.updateAfterOrderItemState(itemid)==1){
            return 1;
        }else{
            return 0;
        }
    }
}
