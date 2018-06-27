package meiHu.entity;

import java.util.Date;

public class ShopGoodsComment {
    private Goods goods ;
    private ForumUser forumUser ;
    private String content ;
    private Date createtime ;

    public Date getCreatetime() {
        return createtime;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public ForumUser getForumUser() {
        return forumUser;
    }

    public void setForumUser(ForumUser forumUser) {
        this.forumUser = forumUser;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
