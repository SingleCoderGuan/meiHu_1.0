package meiHu.entity;

public class ForumFocus {
    private Integer focusid;

    private ForumUser user ;

    private ForumUser focusedUser;

    public Integer getFocusid() {
        return focusid;
    }

    public void setFocusid(Integer focusid) {
        this.focusid = focusid;
    }

    public ForumUser getUser() {
        return user;
    }

    public void setUser(ForumUser user) {
        this.user = user;
    }

    public ForumUser getFocusedUser() {
        return focusedUser;
    }

    public void setFocusedUser(ForumUser focusedUser) {
        this.focusedUser = focusedUser;
    }
}