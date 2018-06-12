package meiHu.service;

import meiHu.dao.OffLevelMapper;
import meiHu.dao.UserOffMapper;
import meiHu.entity.OffLevel;
import meiHu.entity.UserOff;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExchangeServiceImpl implements  ExchangeService {

    @Autowired
    private UserOffMapper userOffMapper;
    @Autowired
    private OffLevelMapper offLevelMapper;


   /* @Override
    public List<OffLevel> selectAllOffLevel() {

        return offLevelMapper.selectAllOffLevel();
    }
*/
    @Override
    public void deleteOffByOffid(int offid) {
        offLevelMapper.deleteOffByOffid(offid);
    }

    @Override
    public OffLevel selectOffLevelByOffid(int offid) {
        return offLevelMapper.selectOffLevelByOffid(offid);
    }


   /* @Override
    public UserOff selectOffIntoUser(int uid, int offid) {
        return userOffMapper.selectOffIntoUser(uid, offid);
    }
*/
   /* @Override
    public void addOffIntoUser(int uid, int offid, int firstnum) {
        userOffMapper.addOffIntoUser(uid, offid, firstnum);
    }*/

    @Override
    public void addUserOffNum(int uid, int offid) {

        userOffMapper.addUserOffNum(uid, offid);
    }

    @Override
    public void deleteOffFromUser(int uid, int offid) {

        userOffMapper.deleteOffFromUser(uid, offid);
    }

    @Override
    public void updateUserPoint(int uid, int consumpoint) {

        userOffMapper.updateUserPoint(uid, consumpoint);
    }



    @Override
    public List<UserOff> selectAllOffByUid(int uid) {

        return userOffMapper.selectAllOffByUid(uid);
    }
}
