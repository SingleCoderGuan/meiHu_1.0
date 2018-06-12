package meiHu.dao;

import meiHu.entity.ForumCollection;
import meiHu.entity.ForumPost;

import java.util.List;

public interface ForumCollectionMapper {
    /**
     * 根据帖子pid查询该帖子被收藏的次数
     * @param pid   执行select的帖子的pid
     * @return  该帖子被收藏的次数
     */
    public int selectCollectedCountByPid(int pid);

    //用户对一条帖子进行收藏
    public int addCollectionByUidAndPid(int uid,int pid);

    //用户对一条帖子进行取消收藏
    public int deleteCollectionByUidAndPid(int uid,int pid);

    //查询该帖子有没有被收藏过
    public ForumCollection selectIfCollection(int uid,int pid);

}
