package meiHu.service;

import meiHu.entity.ForumFocus;

public interface FocusService {
    public boolean addFocusUser(int uid,int focusuid);

    public int selectUserFocusNum(int uid);

    public int selectUserFocusedNum(int uid);

    public ForumFocus selectFocusIfExist(int uid, int focusuid);
}
