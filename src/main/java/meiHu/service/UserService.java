package meiHu.service;

import meiHu.entity.ForumUser;

import java.util.List;

public interface UserService {
    /**
     * 通过用户名在数据库中查找是否有该用户
     * @param uname 执行select的用户名
     * @return 该用户名在数据库中对应的数据
     */
    public ForumUser findUserByUname(String uname);

    /**
     * 向数据库用户表中添加一行数据
     * @param uname 用户名
     * @param password  用户密码
     * @param tel 电话号码
     * @return
     */
    public boolean insertUser(String uname,String password,String tel);

    /**
     * 根据电话号码查询该电话号码是否已被注册
     * @param tel   执行select的电话号码
     * @return  该tel对应的用户
     */
    public ForumUser findUserByTel(String tel) ;

    /**
     * 根据uid查询该用户关注的用户
     * @param uid   执行查询的用户uid
     * @return  该用户关注的人
     */
    public List<ForumUser> findFocusUsersByUid(int uid);

    /**
     * 根据uid查询该用户的追随者
     * @param uid 执行查询的uid
     * @return  所有该用户的追随者
     */
    public List<ForumUser> findFollowersByUid(int uid);
}
