package meiHu.service;


import com.github.pagehelper.PageInfo;
import meiHu.entity.ForumCommentreport;
import meiHu.entity.ForumPost;
import meiHu.entity.ForumPostreport;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface AdminService {

    public List<ForumPostreport> getAll() ;

    public void deletePostByPid(int pid);

    public List<ForumCommentreport> getAllCommentReports();

    public void deleteCommentByCid(int cid);

    public PageInfo<ForumPostreport> selectAllForumPostreport(Map<String, Object> map) ;

    public PageInfo<ForumCommentreport> selectAllForumCommentreport(Map<String, Object> map) ;

}
