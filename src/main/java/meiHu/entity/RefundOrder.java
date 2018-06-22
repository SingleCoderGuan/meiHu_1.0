package meiHu.entity;

import java.util.Date;

public class RefundOrder {
    private Integer drawbackid;
    private Order order;
    private Integer itemid;
    private ForumUser user;
    private String drawbackreason;
    private Date drawbacktime;
    private String detail;
    private int processstate;//0表示管理员未审核退款订单信息，1表示管理员已接受用户的退款,2表示管理员拒绝接受用户提交的退款信息
    public RefundOrder() {
    }

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public Integer getDrawbackid() {
        return drawbackid;
    }

    public void setDrawbackid(Integer drawbackid) {
        this.drawbackid = drawbackid;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }

    public String getDrawbackreason() {
        return drawbackreason;
    }

    public void setDrawbackreason(String drawbackreason) {
        this.drawbackreason = drawbackreason;
    }

    public Date getDrawbacktime() {
        return drawbacktime;
    }

    public void setDrawbacktime(Date drawbacktime) {
        this.drawbacktime = drawbacktime;
    }

    public int getProcessstate() {
        return processstate;
    }

    public void setProcessstate(int processstate) {
        this.processstate = processstate;
    }
}
