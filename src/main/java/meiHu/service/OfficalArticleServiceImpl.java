package meiHu.service;

import meiHu.dao.ForumOfficalarticleMapper;
import meiHu.entity.ForumOfficalarticle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OfficalArticleServiceImpl implements  OfficalArticleService {
    @Autowired
    private ForumOfficalarticleMapper forumOfficalarticleMapper ;
    @Override
    public boolean insertArticle(ForumOfficalarticle forumOfficalarticle) {
        return forumOfficalarticleMapper.insertArticle(forumOfficalarticle);
    }

    @Override
    public boolean deleteArticle(int oaid) {
        return forumOfficalarticleMapper.deleteArticle(oaid);
    }
}
