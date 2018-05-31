package meiHu.dao;


import meiHu.entity.ShopAddress;

public interface ShopAddressMapper {
    //用户添加收货地址
  public boolean addAddress(ShopAddress shopAddress);

//  删除收货地址
  public boolean deleteAddress(ShopAddress shopAddress);
}