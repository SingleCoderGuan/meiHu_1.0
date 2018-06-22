package meiHu.service;

import meiHu.dao.GoodsMapper;
import meiHu.entity.Goods;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class HomepageServiceImpl implements HomepageService {
    @Autowired
    private GoodsMapper goodsMapper ;
    @Override
    public List<Goods> getRecommendList() {
        return goodsMapper.selectRecommendList();
    }
}
