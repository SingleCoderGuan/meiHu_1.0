package meiHu.dao;


import meiHu.entity.ShopItem;

public interface ShopItemMapper {
    //添加购物车中商品到item
    public boolean addItem(int cartid);


    //将多个item添加至订单
    public boolean addManyItemIntoOrder(int[] itemids);


    //查询该item下的商品详情
    public ShopItem selectItemById(int itemid);

}