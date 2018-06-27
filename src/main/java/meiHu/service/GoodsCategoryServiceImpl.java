package meiHu.service;

import meiHu.dao.GoodsCategoryMapper;
import meiHu.entity.GoodsCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GoodsCategoryServiceImpl implements  GoodsCategoryService {
    @Autowired
    private GoodsCategoryMapper goodsCategoryMapper;
    @Override
    public List<GoodsCategory> getAllGoodsCategory() {
        return goodsCategoryMapper.getAllGoodsCategory();
    }
}
