package meiHu.dao;

import meiHu.entity.ForumComment;

public interface ForumCommentMapper {
    /**
     * 根据用户uid查询所有该用户发布的评论
     * @param uid 执行select的用户uid
     * @return  该用户uid对应的评论
     */
    public ForumComment selectCommentByUid(int uid) ;
    /**
     * 根据帖子pid查询所有该用户发布的评论
     * @param pid 执行select的用户uid
     * @return  该帖子pid对应的评论
     */
    public ForumComment selectCommentBypid(int pid) ;

}
