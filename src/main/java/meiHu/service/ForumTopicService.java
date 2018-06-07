package meiHu.service;

import meiHu.entity.ForumTopic;

public interface ForumTopicService {
    /**
     *  根据tid查询对应的板块对象
     * @param tid   需要查询的tid
     * @return  对应的板块对象
     */
    public ForumTopic selectTopicByTid(int tid);
}
