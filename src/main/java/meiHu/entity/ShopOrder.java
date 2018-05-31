package meiHu.entity;

import java.util.Date;

public class ShopOrder {
    private Integer orderid;

    private Integer uid;

    private Date ordertime;

    private Integer offid;

    private String orderstatus;

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Date getOrdertime() {
        return ordertime;
    }

    public void setOrdertime(Date ordertime) {
        this.ordertime = ordertime;
    }

    public Integer getOffid() {
        return offid;
    }

    public void setOffid(Integer offid) {
        this.offid = offid;
    }

    public String getOrderstatus() {
        return orderstatus;
    }

    public void setOrderstatus(String orderstatus) {
        this.orderstatus = orderstatus == null ? null : orderstatus.trim();
    }
}