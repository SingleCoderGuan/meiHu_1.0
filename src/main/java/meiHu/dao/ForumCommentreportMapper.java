package meiHu.dao;

import meiHu.entity.ForumCommentreport;

import java.util.List;

public interface ForumCommentreportMapper {
    /**
     * 查询所有评论举报表中的数据
     * @return  所有评论举报表中的数据
     */
    public List<ForumCommentreport> getAllCommentReports() ;
}
