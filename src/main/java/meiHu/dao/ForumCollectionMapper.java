package meiHu.dao;

public interface ForumCollectionMapper {
    /**
     * 根据帖子pid查询该帖子被收藏的次数
     * @param pid   执行select的帖子的pid
     * @return  该帖子被收藏的次数
     */
    public int selectCollectedCountByPid(int pid);
}
