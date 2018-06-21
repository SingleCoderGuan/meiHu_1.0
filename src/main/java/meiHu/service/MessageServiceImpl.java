package meiHu.service;

import meiHu.dao.ForumCommentMapper;
import meiHu.entity.ForumComment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class MessageServiceImpl implements MessageService {
    @Autowired
    private ForumCommentMapper forumCommentMapper;
    @Override
    public List<ForumComment> getMessage(int uid) {

        return forumCommentMapper.getNewComments(uid) ;
    }
}
