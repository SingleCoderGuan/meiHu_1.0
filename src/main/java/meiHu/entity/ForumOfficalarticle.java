package meiHu.entity;

import java.util.Date;

public class ForumOfficalarticle {
    private Integer oaid;

    private String oatitle;

    private String oacontent;

    private Date publishDate;

    public Date getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(Date publishDate) {
        this.publishDate = publishDate;
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