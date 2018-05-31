package meiHu.dao;



import meiHu.entity.ShopCart;

import java.util.List;

public interface ShopCartMapper {
    //添加商品到购物车
    public boolean addCart(int goodid);
//    删除购物车中商品
    public boolean deleteCart(int cartid);
    //查询购物车中所有商品
    public List<ShopCart> selectAllCart();
}