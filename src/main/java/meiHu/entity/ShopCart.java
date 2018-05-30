package meiHu.entity;

import java.util.Date;

public class ShopCart {
    private Integer cartid;

    private Integer uid;

    private Integer goodid;

    private Integer cartcount;

    private Date cartdate;

    public Integer getCartid() {
        return cartid;
    }

    public void setCartid(Integer cartid) {
        this.cartid = cartid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getGoodid() {
        return goodid;
    }

    public void setGoodid(Integer goodid) {
        this.goodid = goodid;
    }

    public Integer getCartcount() {
        return cartcount;
    }

    public void setCartcount(Integer cartcount) {
        this.cartcount = cartcount;
    }

    public Date getCartdate() {
        return cartdate;
    }

    public void setCartdate(Date cartdate) {
        this.cartdate = cartdate;
    }
}