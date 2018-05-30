package meiHu.entity;

public class ForumCommentreport {
    private Integer reportid;

    private ForumUser user ;

    private ForumComment comment ;

    private String reportreason;

    public Integer getReportid() {
        return reportid;
    }

    public void setReportid(Integer reportid) {
        this.reportid = reportid;
    }

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }

    public ForumComment getComment() {
        return comment;
    }

    public void setComment(ForumComment comment) {
        this.comment = comment;
    }

    public String getReportreason() {
        return reportreason;
    }

    public void setReportreason(String reportreason) {
        this.reportreason = reportreason == null ? null : reportreason.trim();
    }
}