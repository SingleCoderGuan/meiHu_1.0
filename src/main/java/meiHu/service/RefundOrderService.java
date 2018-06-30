package meiHu.service;

import meiHu.entity.RefundOrder;

import java.util.List;

public interface RefundOrderService {
    //在退款表中插入退款信息
    public  int insertDrawbackInfo(RefundOrder ro, int itemid);
    //管理员查询退款订单信息
    public List<RefundOrder> selectDrawbackInfo();
    //管理员接受退款
    public int updateDrawbackInfo(int drawbackid, int itemid);
    //用户查询自己提交的退款订单
    public List<RefundOrder> selectDrawbackInfoById(int uid);
}
