package meiHu.dao;

import meiHu.entity.ForumSign;

public interface ForumSignMapper {
    /**
     * 根据用户uid查询该用户签到表中数据
     * @param uid   执行select的用户uid
     * @return  该用户uid对应签到表中的数据
     */
    public ForumSign selectSignnumberByUid(int uid);

}
