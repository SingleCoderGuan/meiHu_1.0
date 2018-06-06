package meiHu.service;

import meiHu.dao.ForumFocusMapper;
import meiHu.entity.ForumFocus;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FocusServiceImpl implements FocusService {
    @Autowired
    private ForumFocusMapper forumFocusMapper;
    @Override
    public boolean addFocusUser(int uid, int focusuid) {
        int a =  forumFocusMapper.addFocusUser(uid,focusuid);
        if(a==1){
            return true;
        }else{
            return false;
        }

    }

    @Override
    public int selectUserFocusNum(int uid) {
        return forumFocusMapper.selectUserFocusNum(uid);
    }

    @Override
    public int selectUserFocusedNum(int uid) {
        return forumFocusMapper.selectUserFocusedNum(uid);
    }

    @Override
    public ForumFocus selectFocusIfExist(int uid, int focusuid) {
        return forumFocusMapper.selectFocusIfExist(uid,focusuid);
    }
}
