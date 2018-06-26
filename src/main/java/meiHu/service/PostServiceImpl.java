package meiHu.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import meiHu.dao.*;
import meiHu.entity.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private ForumPostMapper forumPostMapper;
    @Autowired
    private ForumCollectionMapper collectionMapper ;
    @Autowired
    private ForumCommentMapper commentMapper ;
    @Autowired
    private ForumLikeMapper likeMapper ;
    @Autowired
    private ForumPostreportMapper postreportMapper ;
    @Override
    public PageInfo<ForumPost> selectPosts(Map<String, Object> map) {
        //起始条件
        int curPage= (int) map.get("curPage");
        //查询的条数
        int pageSize=(int)map.get("pageSize");

        PageHelper.startPage(curPage,pageSize);

        List<ForumPost> postList = forumPostMapper.selectPostsByTid((Integer) map.get("tid")) ;
        PageInfo<ForumPost> pageInfo=new PageInfo<>(postList);
        return  pageInfo ;
    }
@Override
    public PageInfo<ForumPost> selectPostsByCreatetime(Map<String ,Object> map) {
    //起始条件
    int curPage= (int) map.get("curPage");
    //查询的条数
    int pageSize=(int)map.get("pageSize");

    PageHelper.startPage(curPage,pageSize);

    List<ForumPost> postList = forumPostMapper.selectAllPostsOrderByCreatetime((Integer) map.get("tid")) ;
    PageInfo<ForumPost> pageInfo=new PageInfo<>(postList);
    return  pageInfo ;
}
@Override
    public PageInfo<ForumPost> selectPostsByVisit(Map<String ,Object> map) {
    //起始条件
    int curPage= (int) map.get("curPage");
    //查询的条数
    int pageSize=(int)map.get("pageSize");

    PageHelper.startPage(curPage,pageSize);

    List<ForumPost> postList = forumPostMapper.selectAllPostsOrderByVisits((Integer) map.get("tid")) ;
    PageInfo<ForumPost> pageInfo=new PageInfo<>(postList);
    return  pageInfo ;
}

    @Override
    public List<ForumPost> selectCollectionByUserUid(int uid) {
        return forumPostMapper.selectCollectedPostsByUid(uid);
    }

    @Override
    public List<ForumPost> selectPostsByUid(int uid) {
        return forumPostMapper.selectPostsByUid(uid);
    }

    @Override
    public boolean postNewPost(ForumPost post) {
        return forumPostMapper.insert(post);
    }

    @Override
    public List<ForumPost> selectPostsByPtitle(String keyword) {
        return forumPostMapper.selectPostsByPtitle(keyword);
    }

    @Override
    public ForumPost selectPostByPid(int pid) {
        return forumPostMapper.selectPostByPid(pid);
    }

    @Override
    public boolean updatePost(ForumPost post) {
        return forumPostMapper.update(post);
    }

    @Override
    public boolean deletePost(int pid) {
        return forumPostMapper.deletePostByPid(pid);
    }


    @Override
    public ForumPost selectPostsByPtitleHot(String keyword) {
        return forumPostMapper.selectKeywordHot(keyword);
    }
}
