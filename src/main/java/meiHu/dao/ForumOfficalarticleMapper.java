package meiHu.dao;

import meiHu.entity.ForumOfficalarticle;

import java.util.List;

public interface ForumOfficalarticleMapper {
    /**
     * 查询所有官方文章
     * @return  所有官方文章
     */
    public List<ForumOfficalarticle> getAllOfficalArticles();

    /**
     * 根据官方文章oaid查询某一篇官方文章
     * @param oaid  执行select的官方文章oaid
     * @return  该oaid对应的官方文章
     */
    public ForumOfficalarticle selectOfficalArticleByOaid(int oaid);

    /**
     * 向官方文章表中插入一条数据
     * @param forumOfficalarticle
     * @return
     */
    public boolean insertArticle(ForumOfficalarticle forumOfficalarticle) ;

    /**
     * 根据id删除文章
     * @param oaid
     * @return
     */
    public boolean deleteArticle(int oaid);
}
