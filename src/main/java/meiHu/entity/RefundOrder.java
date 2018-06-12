package meiHu.entity;

import java.util.Date;

public class RefundOrder {
    private Integer drawbackid;
    private Order order;
    private ForumUser user;
    private String drawbackreason;
    private Date drawbacktime;
    private String detail;
    private String processstate;
    public RefundOrder() {
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

    public String getProcessstate() {
        return processstate;
    }

    public void setProcessstate(String processstate) {
        this.processstate = processstate;
    }
}
