package meiHu.service;

import meiHu.dao.ForumOccontentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ForumOfficalCommentServiceImpl implements ForumOfficalCommentService {
   @Autowired
    private ForumOccontentMapper forumOccontentMapper;

    @Override
    public boolean insertOccontent(int uid, int ocid, String content) {
        int a = forumOccontentMapper.insertOccontent(uid,ocid,content);
        if(a==1){
            return true;
        }else{
            return false;
        }
    }

    @Override
    public List<meiHu.entity.ForumOfficalComment> selectAllOccontent(int occid) {
        return forumOccontentMapper.selectAllOccontent(occid);
    }
}
