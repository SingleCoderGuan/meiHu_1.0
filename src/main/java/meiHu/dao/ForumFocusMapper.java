package meiHu.dao;

import meiHu.entity.ForumFocus;

public interface ForumFocusMapper {
    //关注某人
    public int addFocusUser(int uid,int focusuid);

    //查询某个人的关注数量
    public int selectUserFocusNum(int uid);
    //查询某个人被关注数量
    public int selectUserFocusedNum(int uid);

    //查询给用户是否被关注过
    public ForumFocus selectFocusIfExist(int uid, int focusuid);


}
