package meiHu.dao;

import meiHu.entity.ForumOfficalComment;

import java.util.List;

public interface ForumOccontentMapper {
    //对官方文章进行评论
    public int insertOccontent(int uid,int ocid,String content);

    //对某文章的所有评论
    public List<ForumOfficalComment> selectAllOccontent(int occid);
}
