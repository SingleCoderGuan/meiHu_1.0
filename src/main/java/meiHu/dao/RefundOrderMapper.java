package meiHu.dao;

import meiHu.entity.RefundOrder;

import java.util.List;

public interface RefundOrderMapper {
    //在退款表中插入退款信息
    public  int addDrawbackInfo(RefundOrder ro);
    //后台管理员查询用户退款信息
    public List<RefundOrder> showAllDrawbackInfo();
    //管理员同意接受退款，修改退款信息的状态
    public int updateDrawbackState(int drawbackid);
}
