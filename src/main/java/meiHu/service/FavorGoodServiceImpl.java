package meiHu.service;


import meiHu.dao.FavorGoodMapper;
import meiHu.entity.Favor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class FavorGoodServiceImpl implements FavorGoodService {

    @Autowired
    private FavorGoodMapper favorGoodMapper;


    @Override
    public boolean addCollectionByUidAndGoodid(int uid, int goodid) {
        int a=favorGoodMapper.addCollectionByUidAndGoodid(uid,goodid);
        if(a==1){
            return true;
        }else {
            return false;
        }

    }

    @Override
    public List<Favor> findMyFavorByUid(int uid) {
        return favorGoodMapper.findMyFavor(uid);
    }


    @Override
    public Favor selectIfCollection(int uid, int goodid) {
        return favorGoodMapper.selectIfCollection(uid,goodid);
    }

    @Override
    public boolean deleteCollectionByUidAndGoodid(int uid, int goodid) {
        int a=favorGoodMapper.deleteCollectionByUidAndGoodid(uid,goodid);
        if(a==1){
            return true;
        }else{
            return false;
        }

    }
}
