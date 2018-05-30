package meiHu.entity;

public class ForumSign {
    private Integer signid;

    private ForumUser user ;

    private Integer signnumber;

    public Integer getSignid() {
        return signid;
    }

    public void setSignid(Integer signid) {
        this.signid = signid;
    }

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }

    public Integer getSignnumber() {
        return signnumber;
    }

    public void setSignnumber(Integer signnumber) {
        this.signnumber = signnumber;
    }
}