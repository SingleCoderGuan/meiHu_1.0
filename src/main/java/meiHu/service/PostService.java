package meiHu.service;

import meiHu.entity.ForumPost;

import java.util.List;

public interface PostService {
    /**
     * 通过用户uid查询该用户收藏的所有帖子
     * @param uid 需要查询的uid
     * @return  该uid对应的所有帖子
     */
    public List<ForumPost> selectCollectionByUserUid(int uid) ;

    /**
     * 根据用户uid查询该用户发布的帖子
     * @param uid 需要查询的uid
     * @return  该uid发布的帖子
     */
    public List<ForumPost> selectPostsByUid(int uid) ;

    /**
     * 用户发帖
     * @param post 需要发的帖子
     * @return  是否成功发帖
     */
    public boolean postNewPost(ForumPost post) ;

    public List<ForumPost> selectPostsByPtitle(String keyword);

    public ForumPost selectPostByPid(int pid) ;

    public boolean updatePost(ForumPost post) ;
//某用户收藏帖子数量
    public int selectCollectionNumByUid(int uid);
}
