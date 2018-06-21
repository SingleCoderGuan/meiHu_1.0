package meiHu.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import meiHu.dao.ForumCommentreportMapper;
import meiHu.dao.ForumPostreportMapper;
import meiHu.entity.ForumCommentreport;
import meiHu.entity.ForumPost;
import meiHu.entity.ForumPostreport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private ForumPostreportMapper forumPostreportMapper;
    @Autowired
    private ForumCommentreportMapper forumCommentreportMapper;
    @Override
    public List<ForumPostreport> getAll() {
        return forumPostreportMapper.getAll();
    }

    @Override
    public void deletePostByPid(int pid) {
        forumPostreportMapper.deletePostByPid(pid);
    }

    @Override
    public List<ForumCommentreport> getAllCommentReports() {
        return forumCommentreportMapper.getAllCommentReports();
    }

    @Override
    public void deleteCommentByCid(int cid) {
        forumCommentreportMapper.deleteCommentByCid(cid);
    }

    @Override
    public PageInfo<ForumPostreport> selectAllForumPostreport(Map<String, Object> map) {
        int curPage= (int) map.get("curPage");
        //查询的条数
        int pageSize=(int)map.get("pageSize");

        PageHelper.startPage(curPage,pageSize);

        List<ForumPostreport> postList = forumPostreportMapper.getAll() ;
        PageInfo<ForumPostreport> pageInfo=new PageInfo<>(postList);
        return  pageInfo ;
    }

    @Override
    public PageInfo<ForumCommentreport> selectAllForumCommentreport(Map<String, Object> map) {
        int curPage= (int) map.get("curPage");
        //查询的条数
        int pageSize=(int)map.get("pageSize");

        PageHelper.startPage(curPage,pageSize);

        List<ForumCommentreport> commentreportList = forumCommentreportMapper.getAllCommentReports() ;
        PageInfo<ForumCommentreport> pageInfo=new PageInfo<>(commentreportList);
        return  pageInfo ;
    }
}
