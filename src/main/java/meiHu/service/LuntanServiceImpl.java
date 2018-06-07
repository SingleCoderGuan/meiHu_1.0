package meiHu.service;

import meiHu.dao.*;
import meiHu.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class LuntanServiceImpl implements LuntanService{

    private final ForumTopicMapper forumTopicMapper;
    private final ForumPostMapper forumPostMapper;
    private final ForumCollectionMapper forumCollectionMapper;
    private final ForumLikeMapper forumLikeMapper;
    private final ForumPostreportMapper forumPostreportMapper;
    private final ForumCommentMapper forumCommentMapper;
    private final ForumCommentreportMapper forumCommentreportMapper;


    @Autowired
    public LuntanServiceImpl(ForumTopicMapper forumTopicMapper, ForumPostMapper forumPostMapper, ForumCollectionMapper forumCollectionMapper, ForumLikeMapper forumLikeMapper, ForumPostreportMapper forumPostreportMapper, ForumCommentMapper forumCommentMapper, ForumCommentreportMapper forumCommentreportMapper) {
        this.forumTopicMapper = forumTopicMapper;
        this.forumPostMapper = forumPostMapper;
        this.forumCollectionMapper = forumCollectionMapper;
        this.forumLikeMapper = forumLikeMapper;
        this.forumPostreportMapper = forumPostreportMapper;
        this.forumCommentMapper = forumCommentMapper;
        this.forumCommentreportMapper = forumCommentreportMapper;
    }


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

    @Override
    public boolean addPostReport(ForumPostreport forumPostreport) {
        int a= forumPostreportMapper.addPostReport(forumPostreport);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean addForumComment(ForumComment forumComment) {
        int a = forumCommentMapper.addForumComment(forumComment);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public int selectCollectedCountByPid(int pid) {
        return forumCollectionMapper.selectCollectedCountByPid(pid);
    }

    @Override
    public boolean updatePostLikeNumByPid(int pid) {
        int a = forumPostMapper.updatePostLikeNumByPid(pid);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean updatePostLikeNumByPidSub(int pid) {
        int a = forumPostMapper.updatePostLikeNumByPidSub(pid);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }
    @Override
    public void updatePostVisitNum(int pid){
        forumPostMapper.updatePostVisitNum(pid);
    }

    @Override
    public void updatePostVisitNumSub(int pid) {
        forumPostMapper.updatePostVisitNumSub(pid);
    }

    @Override
    public int selectPostCommentNum(int pid) {
        return forumCommentMapper.selectPostCommentNum(pid);
    }

    @Override
    public List<ForumComment> selectAllPostCommentByPid(int pid) {
        return forumCommentMapper.selectAllPostCommentByPid(pid);
    }

    @Override
    public boolean addCommentReport(ForumCommentreport forumCommentreport) {
        int a = forumCommentreportMapper.addCommentReport(forumCommentreport);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public boolean addCommentForComment(ForumComment forumComment) {
        int a = forumCommentMapper.addCommentForComment(forumComment);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public List<ForumComment> selectAllCommentForComment(int ccid) {
        return forumCommentMapper.selectAllCommentForComment(ccid);
    }

    @Override
    public int[] selectAllCidByPid(int pid) {
        return forumCommentMapper.selectAllCidByPid(pid);
    }

    @Override
    public int selectCommentCommentNum(int cid) {
        return forumCommentMapper.selectCommentCommentNum(cid);
    }

    @Override
    public int SelectUidByPid(int pid) {
        return forumPostMapper.SelectUidByPid(pid);
    }

    @Override
    public String selectTnameBuTid(int tid) {
        return forumTopicMapper.selectTnameBuTid(tid);
    }

    @Override
    public boolean insert(ForumPost post) {
        return forumPostMapper.insert(post);
    }


}
