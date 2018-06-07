package meiHu.entity;

public class UserOff {
    private int requireid;
    private OffLevel offLevel;
    private ForumUser forumUser;
    private int remainnum;

    public int getRemainnum() {
        return remainnum;
    }

    public void setRemainnum(int remainnum) {
        this.remainnum = remainnum;
    }

    public int getRequireid() {
        return requireid;
    }

    public void setRequireid(int requireid) {
        this.requireid = requireid;
    }

    public OffLevel getOffLevel() {
        return offLevel;
    }

    public void setOffLevel(OffLevel offLevel) {
        this.offLevel = offLevel;
    }

    public ForumUser getForumUser() {
        return forumUser;
    }

    public void setForumUser(ForumUser forumUser) {
        this.forumUser = forumUser;
    }
}
