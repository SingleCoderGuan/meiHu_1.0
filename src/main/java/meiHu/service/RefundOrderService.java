package meiHu.service;

import meiHu.entity.RefundOrder;

public interface RefundOrderService {
    //在退款表中插入退款信息
    public  int insertDrawbackInfo(RefundOrder ro);
}
