package meiHu.service;

import meiHu.dao.ForumFocusMapper;
import org.springframework.beans.factory.annotation.Autowired;

public class FocusServiceImpl implements FocusService {
    @Autowired
    private ForumFocusMapper forumFocusMapper;
    @Override
    public int addFocusUser(int uid, int focusuid) {
        return forumFocusMapper.addFocusUser(uid,focusuid);
    }
}
