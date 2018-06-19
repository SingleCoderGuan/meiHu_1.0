package meiHu.service;

import meiHu.dao.ForumCommentMapper;
import meiHu.dao.ForumUserMapper;
import meiHu.entity.ForumComment;
import meiHu.entity.ForumUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private ForumUserMapper forumUserMapper ;
    @Autowired
    private ForumCommentMapper forumCommentMapper ;
    @Override
    public ForumUser findUserByUname(String uname) {
        return forumUserMapper.selectUsersByUname(uname);
    }

    @Override
    public boolean insertUser(String uname, String password, String tel, Date registertime) {
        return forumUserMapper.insertUser(uname,password,tel,registertime);
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

    @Override
    public boolean updateUser(ForumUser user) {
        return forumUserMapper.updateUser(user);
    }

    @Override
    public ForumUser selectUserByUid(int uid) {
        return forumUserMapper.selectUserByUid(uid);
    }

    @Override
    public boolean resetPass(ForumUser user) {
        return forumUserMapper.resetPass(user);
    }
@Override
    public int selectPointByUid(int uid){
        return forumUserMapper.selectPointByUid(uid);
}
    @Override
    public List<ForumUser> selectUsersByTitleId(){
        return forumUserMapper.selectUsersByTitleId();
    }

    //查询用户获赞数
    @Override
    public int selectLikeNumByUid(int uid){
        return forumUserMapper.selectLikeNumByUid(uid);
    }

    //查询用户收藏数-->
    @Override
    public int selectCollectionNumByUid(int uid){
        return forumUserMapper.selectCollectionNumByUid(uid);
    }

    @Override
    public List<ForumComment> getNewComments(int uid) {
        return forumCommentMapper.selectNewComments(uid);
    }

    @Override
    public boolean readComment(int cid) {
        return forumCommentMapper.updateCommentState(cid);
    }

    @Override
    public List<ForumComment> getOldComments(int uid) {
        return forumCommentMapper.selectOldComments(uid);
    }
}
