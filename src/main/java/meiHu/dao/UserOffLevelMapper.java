package meiHu.dao;

import meiHu.entity.OffLevel;

import java.util.List;

public interface UserOffLevelMapper {
    /**
     * 根据用户uid查询该用户拥有的优惠券
     * @param uid   执行select的用户uid
     * @return  该用户拥有的优惠券
     */
    public List<OffLevel> selectOffLevelByUid(int uid) ;
}
