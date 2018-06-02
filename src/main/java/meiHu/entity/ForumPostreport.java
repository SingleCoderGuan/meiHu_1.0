package meiHu.entity;

public class ForumPostreport {
    private Integer reportid;

    private Integer uid ;

    private Integer pid ;

    private String reportreason;

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

    public Integer getPid() {
        return pid;
    }

    public void setPid(Integer pid) {
        this.pid = pid;
    }

    public String getReportreason() {
        return reportreason;
    }

    public void setReportreason(String reportreason) {
        this.reportreason = reportreason;
    }

    public ForumPostreport(Integer uid, Integer pid, String reportreason) {
        this.uid = uid;
        this.pid = pid;
        this.reportreason = reportreason;
    }
}