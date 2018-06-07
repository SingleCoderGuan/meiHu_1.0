package meiHu.service;

import meiHu.dao.ForumTopicMapper;
import meiHu.entity.ForumTopic;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ForumTopicServiceImpl implements  ForumTopicService{
    @Autowired
    private ForumTopicMapper forumTopicMapper ;
    @Override
    public ForumTopic selectTopicByTid(int tid) {
        return forumTopicMapper.selectTopicByTid(tid);
    }
}
