package meiHu.entity;

import java.util.Date;

public class ForumComment {
    private Integer cid;

    private Integer  uid ;

    private Integer pid ;

    private Integer ccid;


    private Date commenttime;

    private String commenttext;

    private ForumUser user;

    private ForumComment forumComment;

    public Integer getCcid() {
        return ccid;
    }

    public void setCcid(Integer ccid) {
        this.ccid = ccid;
    }

    public ForumComment getForumComment() {
        return forumComment;
    }

    public void setForumComment(ForumComment forumComment) {
        this.forumComment = forumComment;
    }

    public ForumComment() {
    }

    public ForumComment(Integer cid, Integer uid, Integer pid, Date commenttime, String commenttext, ForumUser user) {
        this.cid = cid;
        this.uid = uid;
        this.pid = pid;
        this.commenttime = commenttime;
        this.commenttext = commenttext;
        this.user = user;
    }

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }

    public ForumComment(int uid, int pid,String commenttext) {
        this.uid = uid;
        this.pid = pid;
        this.commenttext = commenttext;
    }

    public ForumComment(Integer uid, Integer pid, Integer ccid,  String commenttext) {
        this.uid = uid;
        this.pid = pid;
        this.ccid = ccid;

        this.commenttext = commenttext;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
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