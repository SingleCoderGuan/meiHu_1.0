package meiHu.entity;

import java.util.Date;

public class OffLevel {
    private int offid;
    private String offname;
    private int offnum;
    private Date endtime;

    public int getOffid() {
        return offid;
    }

    public void setOffid(int offid) {
        this.offid = offid;
    }

    public String getOffname() {
        return offname;
    }

    public void setOffname(String offname) {
        this.offname = offname;
    }

    public int getOffnum() {
        return offnum;
    }

    public void setOffnum(int offnum) {
        this.offnum = offnum;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }
}
