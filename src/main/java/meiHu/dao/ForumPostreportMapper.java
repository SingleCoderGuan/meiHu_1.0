package meiHu.dao;

import meiHu.entity.ForumPostreport;

import java.util.List;

public interface ForumPostreportMapper {
    /**
     * 查询所有帖子举报表中的数据
     * @return  所有帖子举报表中的内容
     */
    public List<ForumPostreport> getAll() ;

//    用户举报帖子
    public int addPostReport(ForumPostreport forumPostreport);

    /**
     * 根据pid删除帖子举报表中对应数据，为删除帖子做准备
     * @param pid
     * @return
     */
    public boolean deletePostReportByPid(int pid);
}
