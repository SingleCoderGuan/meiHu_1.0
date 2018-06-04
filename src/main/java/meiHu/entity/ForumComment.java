package meiHu.entity;

import java.util.Date;

public class ForumComment {
    private Integer cid;

    private int  uid ;

    private int pid ;


    private Date commenttime;

    private String commenttext;

    public ForumComment(int uid, int pid, String commenttext) {
        this.uid = uid;
        this.pid = pid;
        this.commenttext = commenttext;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public Date getCommenttime() {
        return commenttime;
    }

    public void setCommenttime(Date commenttime) {
        this.commenttime = commenttime;
    }

    public String getCommenttext() {
        return commenttext;
    }

    public void setCommenttext(String commenttext) {
        this.commenttext = commenttext;
    }
}