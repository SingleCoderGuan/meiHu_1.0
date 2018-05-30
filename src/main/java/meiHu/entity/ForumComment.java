package meiHu.entity;

import java.util.Date;

public class ForumComment {
    private Integer cid;

    private ForumUser user ;

    private ForumPost post ;

    private ForumComment comment ;

    private Date commenttime;

    private String commenttext;

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }

    public ForumPost getPost() {
        return post;
    }

    public void setPost(ForumPost post) {
        this.post = post;
    }

    public ForumComment getComment() {
        return comment;
    }

    public void setComment(ForumComment comment) {
        this.comment = comment;
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
        this.commenttext = commenttext == null ? null : commenttext.trim();
    }
}