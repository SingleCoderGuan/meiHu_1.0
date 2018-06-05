package meiHu.service;

import meiHu.dao.ForumPostMapper;
import meiHu.entity.ForumPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private ForumPostMapper forumPostMapper;
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
}
