package meiHu.service;

import meiHu.entity.ForumOfficalarticle;
import meiHu.entity.ForumSign;

import java.util.Date;
import java.util.List;

public interface ArticleService {
    public boolean addSignForNewUser(int uid);

    public boolean addSignForUser(int uid);

    public Date queryIfExistUid(int uid);

    public List<ForumOfficalarticle> getAllOfficalArticles();


    public ForumOfficalarticle selectOfficalArticleByOaid(int oaid);
}
