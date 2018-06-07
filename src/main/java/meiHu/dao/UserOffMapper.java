package meiHu.dao;

import meiHu.entity.UserOff;

import java.util.List;

public interface UserOffMapper {
//判断改种优惠券是否拥有
    public int selectOffIntoUser(int uid,int offid);
    //用户兑换积分券
    public int addOffIntoUser(int uid,int offid);
    //用户兑换券数量+1
    public int addUserOffNum(int uid,int offid);

    //用户使用积分券-1
    public int deleteOffFromUser(int uid,int offid);

    //用户兑换积分更变
    public int updateUserPoint(int uid,int offid);

    //显示某用户的全部积分
    public int selectUserPointByUid(int uid);

    //显示某用户所有优惠券
    public List<UserOff> selectAllOffByUid(int uid);
}
