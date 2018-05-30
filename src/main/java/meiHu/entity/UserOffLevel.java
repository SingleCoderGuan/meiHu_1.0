package meiHu.entity;

public class UserOffLevel {
    private Integer requireid;

    private OffLevel offLevel ;

    private ForumUser user ;

    public Integer getRequireid() {
        return requireid;
    }

    public void setRequireid(Integer requireid) {
        this.requireid = requireid;
    }

    public OffLevel getOffLevel() {
        return offLevel;
    }

    public void setOffLevel(OffLevel offLevel) {
        this.offLevel = offLevel;
    }

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }
}