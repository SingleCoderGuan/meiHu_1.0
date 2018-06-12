package meiHu.service;

import meiHu.entity.OffLevel;
import meiHu.entity.UserOff;

import java.util.List;

public interface ExchangeService {

    //public List<OffLevel> selectAllOffLevel();

    //某兑换券数量-1
    public void deleteOffByOffid(int offid);

    public OffLevel selectOffLevelByOffid(int offid);

    //判断该种优惠券是否拥有
    //public UserOff selectOffIntoUser(int uid, int offid);
    //用户首次兑换积分券
    //public void addOffIntoUser(int uid, int offid, int firstnum);
    //用户兑换券数量+1
    public void addUserOffNum(int uid, int offid);

    //用户使用积分券-1
    public void deleteOffFromUser(int uid, int offid);

    //用户兑换积分更变
    public void updateUserPoint(int uid, int consumpoint);



    //显示某用户所有优惠券
    public List<UserOff> selectAllOffByUid(int uid);

}
