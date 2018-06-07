package meiHu.entity;

public class ForumTopic {
    private Integer tid;

    private String tname;

    @Override
    public String toString() {
        return "ForumTopic{" +
                "tid=" + tid +
                ", tname='" + tname + '\'' +
                ", tpicname='" + tpicname + '\'' +
                '}';
    }

    public String getTpicname() {
        return tpicname;
    }

    public void setTpicname(String tpicname) {
        this.tpicname = tpicname;
    }

    private String tpicname ;
    public Integer getTid() {
        return tid;
    }

    public void setTid(Integer tid) {
        this.tid = tid;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname == null ? null : tname.trim();
    }

}