package meiHu.service;

import meiHu.dao.ForumPostMapper;
import meiHu.dao.ForumTopicMapper;
import meiHu.entity.ForumPost;
import meiHu.entity.ForumTopic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LuntanServiceImpl implements LuntanService{
    @Autowired
    private ForumTopicMapper forumTopicMapper;
    @Autowired
    private ForumPostMapper forumPostMapper;
    @Override
    public List<ForumTopic> getAllTopics() {
        return forumTopicMapper.getAllTopics();
    }

    @Override
    public List<ForumPost> selectPostsByTid(int tid) {
        return forumPostMapper.selectPostsByTid(tid);
    }

    @Override
    public ForumPost selectPostByPid(int pid) {
        return forumPostMapper.selectPostByPid(pid);
    }


}
