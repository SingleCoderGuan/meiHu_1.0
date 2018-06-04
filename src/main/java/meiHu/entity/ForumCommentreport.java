package meiHu.entity;

public class ForumCommentreport {
    private Integer reportid;

    private Integer uid ;

    private Integer cid ;

    private String reportreason;

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