package meiHu.dao;

import meiHu.entity.ForumTitle;

import java.util.List;

public interface ForumTitleMapper {
    /**
     * 查询所有称号
     * @return  称号表中所有数据
     */
    public List<ForumTitle> getAllTitles() ;

    /**
     * 根据用户uid查询该用户对应的称号数据
     * @param uid   执行select的用户uid
     * @return  该用户称号对应的称号数据
     */
    public ForumTitle selectTitleByUid(int uid);
}
