package meiHu.entity;

import java.util.Date;

public class ForumPost {
    private Integer pid;
    private ForumUser user;
    private Date createtime;
    private Integer hot;
    private Integer visitcount ;
    private Integer likecount ;
    private String ptitle;
    public String pcontent;
    private ForumTopic topic;


    @Override
    public String toString() {
        return "ForumPost{" +
                "pid=" + pid +
                ", user=" + user +
                ", createtime=" + createtime +
                ", hot=" + hot +
                ", visitcount=" + visitcount +
                ", likecount=" + likecount +
                ", ptitle='" + ptitle + '\'' +
                ", pcontent='" + pcontent + '\'' +
                ", topic=" + topic +
                '}';
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getHot() {
        return hot;
    }

    public void setHot(Integer hot) {
        this.hot = hot;
    }

    public Integer getVisitcount() {
        return visitcount;
    }

    public void setVisitcount(Integer visitcount) {
        this.visitcount = visitcount;
    }

    public Integer getLikecount() {
        return likecount;
    }

    public void setLikecount(Integer likecount) {
        this.likecount = likecount;
    }

    public String getPtitle() {
        return ptitle;
    }

    public void setPtitle(String ptitle) {
        this.ptitle = ptitle;
    }

    public String getPcontent() {
        return pcontent;
    }

    public void setPcontent(String pcontent) {
        this.pcontent = pcontent;
    }

    public ForumTopic getTopic() {
        return topic;
    }

    public void setTopic(ForumTopic topic) {
        this.topic = topic;
    }
}