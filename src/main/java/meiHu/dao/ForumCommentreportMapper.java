package meiHu.dao;

import meiHu.entity.ForumCommentreport;

import java.util.List;

public interface ForumCommentreportMapper {
    /**
     * 查询所有评论举报表中的数据
     * @return  所有评论举报表中的数据
     */
    public List<ForumCommentreport> getAllCommentReports() ;


    //用户对评论进行举报
    public int addCommentReport(ForumCommentreport forumCommentreport);


    //删除该条评论
    public void deleteCommentByCid(int cid);

}
