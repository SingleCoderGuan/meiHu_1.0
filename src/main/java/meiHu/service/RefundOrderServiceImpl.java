package meiHu.service;

import meiHu.dao.RefundOrderMapper;
import meiHu.entity.RefundOrder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RefundOrderServiceImpl implements RefundOrderService{

    @Autowired
    private RefundOrderMapper refundOrderMapper;
    @Override
    public  int insertDrawbackInfo(RefundOrder ro) {
        if(refundOrderMapper.addDrawbackInfo(ro)==1){
             return 1;
         }else{
             return 0;
         }
    }
}
