package meiHu.dao;

import meiHu.entity.ForumSign;

import java.util.Date;

public interface ForumSignMapper {
    /**
     * 根据用户uid查询该用户签到表中数据
     * @param uid   执行select的用户uid
     * @return  该用户uid对应签到表中的数据
     */
    public ForumSign selectSignnumberByUid(int uid);
    //查询用户在不在签到表中
    public Date queryIfExistUid(int uid);
    //新用户进行签到
    public int addSignForNewUser(int uid);
    //老用户进行签到
    public int addSignForUser(int uid);


//    <p>2、发表帖子 +5 分</p>

    public void fatiezijiawufen(int uid);
//                        <p>3、发表评论 +2 分</p>
    public void fapinglunjialiangfen(int uid);
//                        <p>4、每日签到 +3 分</p>
    public void qiandaojiasanfen(int uid);

}
