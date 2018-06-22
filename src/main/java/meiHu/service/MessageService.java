package meiHu.service;

import meiHu.entity.ForumComment;

import java.util.List;

public interface MessageService {
    /**
     * 根据uid查询该用户有没有新的消息
     * @param uid
     * @return
     */
    public List<ForumComment> getMessage(int uid) ;
}
