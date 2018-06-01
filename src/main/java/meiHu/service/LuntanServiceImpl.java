package meiHu.service;

import meiHu.dao.ForumCollectionMapper;
import meiHu.dao.ForumLikeMapper;
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
    @Autowired
    private ForumCollectionMapper forumCollectionMapper;
    @Autowired
    private ForumLikeMapper forumLikeMapper;

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

    @Override
    public List<ForumPost> selectAllPostsOrderByVisits(int tid) {
        return forumPostMapper.selectAllPostsOrderByVisits(tid);
    }

    @Override
    public List<ForumPost> selectAllPostsOrderByCreatetime(int tid) {
        return forumPostMapper.selectAllPostsOrderByCreatetime(tid);
    }

    @Override
    public boolean addLikeByUidAndPid(int uid, int pid) {
        int a = forumLikeMapper.addLikeByUidAndPid(uid,pid);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean addCollectionByUidAndPid(int uid, int pid) {
        int a =  forumCollectionMapper.addCollectionByUidAndPid(uid,pid);
        if(a==1){
            return true;
        }else{
            return false;
        }

    }

    @Override
    public boolean deleteLikeByUidAndPid(int uid, int pid) {
        int a = forumLikeMapper.deleteLikeByUidAndPid(uid,pid);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean deleteCollectionByUidAndPid(int uid, int pid) {
        int a = forumCollectionMapper.deleteCollectionByUidAndPid(uid,pid);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }


}
