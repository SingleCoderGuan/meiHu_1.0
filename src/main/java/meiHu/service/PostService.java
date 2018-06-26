package meiHu.service;

import com.github.pagehelper.PageInfo;
import meiHu.entity.*;

import java.util.List;
import java.util.Map;

public interface PostService {
    /**
     * 按分页显示所有帖子
     * @param map
     * @return
     */
    public PageInfo<ForumPost> selectPosts(Map<String ,Object> map) ;

    public PageInfo<ForumPost> selectPostsByCreatetime(Map<String ,Object> map) ;

    public PageInfo<ForumPost> selectPostsByVisit(Map<String ,Object> map) ;
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

    /**
     * 根据pid删除帖子 数据库设计表级联删除
     * 删除收藏表中该pid对应数据
     * 删除点赞表中该pid对应数据
     * 删除评论表中该pid对应数据
     * 删除举报表中该pid对应数据
     * @param pid 需要删除的帖子pid
     * @return  是否删除成功
     */
    public boolean deletePost(int pid) ;

    public ForumPost selectPostsByPtitleHot(String keyword);


}
