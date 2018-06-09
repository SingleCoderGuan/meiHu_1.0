package meiHu.dao;

import meiHu.entity.ForumUser;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface ForumUserMapper {
    /**
     * 根据uid从forum_user表中查询该uid对应的用户
     * @param uid 执行select的uid
     * @return  该uid对应的用户
     */
    public ForumUser selectUserByUid(int uid) ;

    /**
     * 根据电话号码查询用户
     * @param tel   执行select的电话号码
     * @return  该tek对应的用户
     */
    public ForumUser selectUserByTel(String tel);

    /**
     * 根据title_id从forum_user表中查询该称号下所有用户
     * @param title_id 执行select的称号title_id
     * @return  所有称号为title_id的用户
     */
    public List<ForumUser> selectUsersByTitleId(int title_id) ;

    /**
     * 根据title_id从forum_user表中查询该称号下所有用户
     * @param uname 执行select的称号title_id
     * @return  所有称号为title_id的用户
     */
    public ForumUser selectUsersByUname(String uname) ;

    /**
     * 根据用户id查询所有关注该用户的用户 forum_user和forum_focus
     * @param focused_user_id   被关注的用户
     * @return  所有关注该用户的用户
     */
    public List<ForumUser> selectUsersByFocusedUserId(int focused_user_id) ;
    /**
     * 查询所有该用户关注的用户 forum_user和forum_focus
     * @param user_uid   需要查询的用户uid
     * @return  被该用户关注的用户
     */
    public List<ForumUser> selectUsersByUserUid(int user_uid) ;

    /**
     * 修改forum_user表中一行数据
     * @param forumUser 修改之后的用户
     * @return 是否修改成功
     */
    public boolean updateUser(ForumUser forumUser) ;

    /**
     * 向用户表中插入一行数据
     * @param uanme 用户名
     * @param passwrod  密码
     * @param tel 电话号码
     * @return 是否插入成功
     */
    public boolean insertUser(@Param("uname")String uanme, @Param("password")String passwrod , @Param("tel")String tel,@Param("registertime")Date registertime) ;

    /**
     * 根据uid查询所有该用户关注的用户
     * @param uid   需要查询的uid
     * @return  所有该用户关注的用户
     */
    public List<ForumUser> selectFocusUsersByUid(int uid) ;

    /**
     * 根据uid查询所有该用户的关注者
     * @param uid 需要查询的用户uid
     * @return  所有关注该用户的用户
     */
    public List<ForumUser> selectFollowerByUid(int uid) ;

    /**
     * 根据uid对该用户密码进行重置
     * @param user 需要重置密码的用户
     * @return  是否成功重置密码
     */
    public boolean resetPass(ForumUser user);
}
