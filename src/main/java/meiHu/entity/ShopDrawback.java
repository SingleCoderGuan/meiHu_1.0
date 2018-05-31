package meiHu.entity;

import java.util.Date;

public class ShopDrawback  {
    private Integer drawbackid;
    private Integer goodid;

    private Integer uid;

    private String drawbackreason;

    private Date drawbacktime;


    private String processstate;

    public Integer getDrawbackid() {
        return drawbackid;
    }

    public void setDrawbackid(Integer drawbackid) {
        this.drawbackid = drawbackid;
    }

    public String getProcessstate() {
        return processstate;
    }

    public void setProcessstate(String processstate) {
        this.processstate = processstate == null ? null : processstate.trim();
    }
    public Integer getGoodid() {
        return goodid;
    }

    public void setGoodid(Integer goodid) {
        this.goodid = goodid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getDrawbackreason() {
        return drawbackreason;
    }

    public void setDrawbackreason(String drawbackreason) {
        this.drawbackreason = drawbackreason == null ? null : drawbackreason.trim();
    }

    public Date getDrawbacktime() {
        return drawbacktime;
    }

    public void setDrawbacktime(Date drawbacktime) {
        this.drawbacktime = drawbacktime;
    }
}