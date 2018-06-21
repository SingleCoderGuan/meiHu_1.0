package meiHu.entity;

import java.util.Date;

public class ForumCommentreport {
    private Integer reportid;
    private Integer uid;
    private Integer cid;
    private String reportreason;
    private Date reporttime;
    private ForumUser user;
    private ForumComment comment;
    public ForumCommentreport() {
    }

    public ForumCommentreport(Integer reportid, Integer uid, Integer cid, String reportreason, Date reporttime, ForumUser user, ForumComment comment) {
        this.reportid = reportid;
        this.uid = uid;
        this.cid = cid;
        this.reportreason = reportreason;
        this.reporttime = reporttime;
        this.user = user;
        this.comment = comment;
    }



    public ForumComment getComment() {
        return comment;
    }

    public void setComment(ForumComment comment) {
        this.comment = comment;
    }

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }


    public Date getReporttime() {
        return reporttime;
    }

    public void setReporttime(Date reporttime) {
        this.reporttime = reporttime;
    }

    public ForumCommentreport(Integer uid, Integer cid, String reportreason) {
        this.uid = uid;
        this.cid = cid;
        this.reportreason = reportreason;
    }

    public Integer getReportid() {
        return reportid;
    }

    public void setReportid(Integer reportid) {
        this.reportid = reportid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getReportreason() {
        return reportreason;
    }

    public void setReportreason(String reportreason) {
        this.reportreason = reportreason == null ? null : reportreason.trim();
    }
}