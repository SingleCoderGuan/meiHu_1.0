package meiHu.dao;

import meiHu.entity.ForumPost;

import java.util.List;


public interface ForumPostMapper {
    /**
     * 根据id查询帖子
     * @param pid
     * @return
     */
    public ForumPost selectPostByPid(int pid);

    /**
     * 查询所有帖子并按访问数量降序排序
     * @return  按访问数降序排序的帖子
     */
    public List<ForumPost> selectAllPostsOrderByVisits(int tid) ;

    /**
     * 查询所有帖子并按发布时间降序排序
     * @return  按发布时间降序排序的帖子
     */
    public List<ForumPost> selectAllPostsOrderByCreatetime(int tid) ;

    /**
     * 查询所有帖子并按发布时间降序排序 forum_post和forum_like
     * @return  按点赞数降序排序的帖子
     */
    public List<ForumPost> selectAllPostsOrderByLikeCount() ;

    /**
     * 根据标题查询帖子
     * @param keyword   标题中含有的字符串
     * @return  所有包含该字符串的帖子
     */
    public List<ForumPost> selectPostsByPtitle(String keyword) ;

    /**
     * 根据用户id查询该用户发的帖子
     * @param uid   要查询的用户uid
     * @return  所有该uid对应的ForumPost对象
     */
    public List<ForumPost> selectPostsByUid(int uid) ;

    /**
     * 根据是否热门查询帖子
     * @param hot   是否热门
     * @return  hot对应状态的所有帖子
     */
    public List<ForumPost> selectPostsByHot(int hot) ;

    /**
     * 查询某一类别下的所有帖子
     * @param tid   类别
     * @return  该类别下的帖子
     */
    public List<ForumPost> selectPostsByTid(int tid) ;

    /**
     * 根据用户uid从forum_collection表中查询该用户
     * 收藏的帖子pid，根据pid从forum_post表中查询此用户
     * 收藏的帖子
     * @param uid   用户uid
     * @return  该用户收藏的帖子
     */
    public List<ForumPost> selectCollectedPostsByUid(int uid) ;

    /**
     * 向forum_post表中添加一行数据
     * @param post 执行insert的帖子
     * @return  是否成功添加
     */
    public boolean insert(ForumPost post) ;

    /**
     * 通过传递的ForumPost对象的pid，update forum_post表中的对应的一行数据
     * @param post 执行update的帖子
     * @return 是否成功修改
     */
    public boolean update(ForumPost post) ;

    /**
     * 通过传递要删除帖子的pid，在forum_post表中删除该id对应的一行数据
     * @param pid 执行delete的帖子
     * @return  是否成功修改
     */
    public boolean deletePostByPid(int pid) ;

    //用户点赞后对帖子表进行更改数据
    public int updatePostLikeNumByPid(int pid);

    public int updatePostLikeNumByPidSub(int pid);
    //用户收藏后对帖子表进行更改数据
    public void updatePostVisitNum(int pid);

    public void updatePostVisitNumSub(int pid);

    //根据帖子号查询uid
    public int SelectUidByPid(int pid);

    public ForumPost selectKeywordHot(String keyword) ;

}
