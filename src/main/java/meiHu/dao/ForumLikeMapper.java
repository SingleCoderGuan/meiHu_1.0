package meiHu.dao;

public interface ForumLikeMapper {
    //用户对一条帖子进行点赞
    public int addLikeByUidAndPid(int uid,int pid);

    //用户对一条帖子取消点赞
    public int deleteLikeByUidAndPid(int uid,int pid);

    /**
     * 根据pid删除对应的点赞信息，为删除该帖子做准备
     * @param pid
     * @return
     */
    public boolean deleteLikeByPid(int pid) ;
}
