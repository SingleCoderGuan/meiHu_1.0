package meiHu.service;

import meiHu.entity.ForumOfficalarticle;

public interface OfficalArticleService {

    public boolean insertArticle(ForumOfficalarticle forumOfficalarticle) ;

    public boolean deleteArticle(int oaid);
}
