package meiHu.entity;

import java.util.Date;

public class ForumOfficalarticle {
    private Integer oaid;

    private String oatitle;

    private String oaprecontent;

    private String oacontent;

    private Date publishtime;

    @Override
    public String toString() {
        return "ForumOfficalarticle{" +
                "oaid=" + oaid +
                ", oatitle='" + oatitle + '\'' +
                ", oaprecontent='" + oaprecontent + '\'' +
                ", oacontent='" + oacontent + '\'' +
                ", publishtime=" + publishtime +
                '}';
    }

    public String getOaprecontent() {
        return oaprecontent;
    }

    public void setOaprecontent(String oaprecontent) {
        this.oaprecontent = oaprecontent;
    }


    public Date getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(Date publishtime) {
        this.publishtime = publishtime;
    }

    public Integer getOaid() {
        return oaid;
    }

    public void setOaid(Integer oaid) {
        this.oaid = oaid;
    }

    public String getOatitle() {
        return oatitle;
    }

    public void setOatitle(String oatitle) {
        this.oatitle = oatitle == null ? null : oatitle.trim();
    }

    public String getOacontent() {
        return oacontent;
    }

    public void setOacontent(String oacontent) {
        this.oacontent = oacontent == null ? null : oacontent.trim();
    }
}