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

    //    <p>2、发表帖子 +5 分</p>

    public void fatiezijiawufen(int uid);
    //                        <p>3、发表评论 +2 分</p>
    public void fapinglunjialiangfen(int uid);
    //                        <p>4、每日签到 +3 分</p>
    public void qiandaojiasanfen(int uid);
}
