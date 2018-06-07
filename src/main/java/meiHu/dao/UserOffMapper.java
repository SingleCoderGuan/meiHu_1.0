package meiHu.dao;

import meiHu.entity.UserOff;

import java.util.List;

public interface UserOffMapper {
//判断该种优惠券是否拥有
    public UserOff selectOffIntoUser(int uid,int offid);
    //用户首次兑换积分券
    public int addOffIntoUser(int uid,int offid,int firstnum);
    //用户兑换券数量+1
    public int addUserOffNum(int uid,int offid);

    //用户使用积分券-1
    public int deleteOffFromUser(int uid,int offid);

    //用户兑换积分更变
    public int updateUserPoint(int uid,int consumpoint);



    //显示某用户所有优惠券
    public List<UserOff> selectAllOffByUid(int uid);


}
