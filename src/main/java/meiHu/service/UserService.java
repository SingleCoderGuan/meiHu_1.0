package meiHu.service;

import meiHu.entity.ForumUser;

public interface UserService {
    /**
     * 通过用户名在数据库中查找是否有该用户
     * @param uname 执行select的用户名
     * @return 该用户名在数据库中对应的数据
     */
    public ForumUser findUserByUname(String uname);
}
