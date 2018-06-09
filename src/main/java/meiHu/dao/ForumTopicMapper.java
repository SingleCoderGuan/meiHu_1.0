package meiHu.dao;

import meiHu.entity.ForumTopic;

import java.util.List;

public interface ForumTopicMapper {
    /**
     * 查询所有论坛版块类别数据
     * @return  版块表中所有数据
     */
    public List<ForumTopic> getAllTopics() ;

    /**
     * 根据版块tid查询该版块数据
     * @param tid   执行select的版块tid
     * @return  该tid对应版块数据
     */
    public ForumTopic selectTopicByTid(int tid) ;
    //根据某个tid查询tname
    public String selectTnameBuTid(int tid);


    //查询某板块的帖子数量
    public int selectPostNumByTid(int tid);
    //查询某板块的评论数量
    public int selectCommentNumByTid(int tid);

}
