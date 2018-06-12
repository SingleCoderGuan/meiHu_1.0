package meiHu.service;

import meiHu.dao.ForumOfficalarticleMapper;
import meiHu.dao.ForumSignMapper;
import meiHu.entity.ForumOfficalarticle;
import meiHu.entity.ForumSign;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {
    @Autowired
    private ForumSignMapper forumSignMapper;
    @Autowired
    private ForumOfficalarticleMapper forumOfficalarticleMapper;

    @Override
    public boolean addSignForNewUser(int uid) {
        int a = forumSignMapper.addSignForNewUser(uid);
        if (a == 1) {
            return true;
        }else {
            return false;
        }

    }

    @Override
    public boolean addSignForUser(int uid) {
        int a = forumSignMapper.addSignForUser(uid);
        if (a == 1) {
            return true;
        }else {
            return false;
        }
    }

    @Override
    public Date queryIfExistUid(int uid) {
        return forumSignMapper.queryIfExistUid(uid);
    }

    @Override
    public List<ForumOfficalarticle> getAllOfficalArticles() {
        return forumOfficalarticleMapper.getAllOfficalArticles();
    }

    @Override
    public ForumOfficalarticle selectOfficalArticleByOaid(int oaid) {
        return forumOfficalarticleMapper.selectOfficalArticleByOaid(oaid);
    }

    @Override
    public void fatiezijiawufen(int uid) {
        forumSignMapper.fatiezijiawufen(uid);
    }

    @Override
    public void fapinglunjialiangfen(int uid) {
        forumSignMapper.fapinglunjialiangfen(uid);
    }

    @Override
    public void qiandaojiasanfen(int uid) {
        forumSignMapper.qiandaojiasanfen(uid);
    }
}
