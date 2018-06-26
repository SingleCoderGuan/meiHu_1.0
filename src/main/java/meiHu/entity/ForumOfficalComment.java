package meiHu.entity;

import java.util.Date;

public class ForumOfficalComment {

    private int occid;
    private int uid;
    private int ocid;
    private String occontent;
    private Date createtime;
    private ForumUser user;
    private ForumOfficalarticle officalarticle;

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }

    public ForumOfficalarticle getOfficalarticle() {
        return officalarticle;
    }

    public void setOfficalarticle(ForumOfficalarticle officalarticle) {
        this.officalarticle = officalarticle;
    }

    public ForumOfficalComment() {
    }


    public int getOccid() {
        return occid;
    }

    public void setOccid(int occid) {
        this.occid = occid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getOcid() {
        return ocid;
    }

    public void setOcid(int ocid) {
        this.ocid = ocid;
    }

    public String getOccontent() {
        return occontent;
    }

    public void setOccontent(String occontent) {
        this.occontent = occontent;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }
}
