package meiHu.service;

import meiHu.entity.Goods;

import java.util.List;

public interface HomepageService {
    /**
     * 获取首页推荐商品
     * @return
     */
    public List<Goods> getRecommendList() ;
}
