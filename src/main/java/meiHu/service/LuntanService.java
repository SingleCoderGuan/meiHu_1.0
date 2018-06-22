package meiHu.service;

import meiHu.entity.*;

import java.util.List;

public interface LuntanService {

    public List<ForumTopic> getAllTopics() ;

    public List<ForumPost> selectPostsByTid(int tid) ;

    public ForumPost selectPostByPid(int pid);

    public List<ForumPost> selectAllPostsOrderByVisits(int tid) ;

    public List<ForumPost> selectAllPostsOrderByCreatetime(int tid) ;

    public boolean addLikeByUidAndPid(int uid, int pid);

    public boolean addCollectionByUidAndPid(int uid, int pid);

    public boolean deleteLikeByUidAndPid(int uid, int pid);

    public boolean deleteCollectionByUidAndPid(int uid, int pid);

    public boolean addPostReport(ForumPostreport forumPostreport);

    public boolean addForumComment(ForumComment forumComment);

    public int selectCollectedCountByPid(int pid);

    public boolean updatePostLikeNumByPid(int pid);

    public boolean updatePostLikeNumByPidSub(int pid);

    public void updatePostVisitNum(int pid);

    public void updatePostVisitNumSub(int pid);

    public int selectPostCommentNum(int pid);

    public List<ForumComment> selectAllPostCommentByPid(int pid);

    public boolean addCommentReport(ForumCommentreport forumCommentreport);

    public boolean addCommentForComment(ForumComment forumComment);

    public List<ForumComment> selectAllCommentForComment(int ccid);

    public int[] selectAllCidByPid(int pid);

    public int selectCommentCommentNum(int cid);

    public int SelectUidByPid(int pid);

    public String selectTnameBuTid(int tid);


    //查询某板块的帖子数量
    public int selectPostNumByTid(int tid);
    //查询某板块的评论数量
    public int selectCommentNumByTid(int tid);

//    public List<ForumUser> selectUsersByTitleId();

  public ForumCollection selectIfCollection(int uid, int pid);



}
