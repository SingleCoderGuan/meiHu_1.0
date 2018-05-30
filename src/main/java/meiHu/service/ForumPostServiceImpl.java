package meiHu.service;

import meiHu.dao.ForumPostMapper;
import meiHu.entity.ForumPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class ForumPostServiceImpl implements ForumPostService {
    @Autowired
    private ForumPostMapper forumPostMapper ;
    @Override
    public List<ForumPost> getAllPosts() {
        return forumPostMapper.selectAllPosts();
    }
}
