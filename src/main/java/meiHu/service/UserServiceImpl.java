package meiHu.service;

import meiHu.dao.ForumUserMapper;
import meiHu.entity.ForumUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private ForumUserMapper forumUserMapper ;
    @Override
    public ForumUser findUserByUname(String uname) {
        return forumUserMapper.selectUsersByUname(uname);
    }

    public boolean insertUser(String uname,String password,String tel){
        return forumUserMapper.insertUser(uname,password,tel);
    }

    @Override
    public ForumUser findUserByTel(String tel) {
        return forumUserMapper.selectUserByTel(tel);
    }

    @Override
    public List<ForumUser> findFocusUsersByUid(int uid) {
        return forumUserMapper.selectFocusUsersByUid(uid);
    }

    @Override
    public List<ForumUser> findFollowersByUid(int uid) {
        return forumUserMapper.selectFollowerByUid(uid);
    }

}
