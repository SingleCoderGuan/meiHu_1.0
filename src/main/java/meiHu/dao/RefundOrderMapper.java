package meiHu.dao;

import meiHu.entity.RefundOrder;

public interface RefundOrderMapper {
    //在退款表中插入退款信息
    public  int addDrawbackInfo(RefundOrder ro);
}
