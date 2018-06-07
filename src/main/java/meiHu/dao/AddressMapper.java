package meiHu.dao;

import meiHu.entity.Address;

import java.util.List;

public interface AddressMapper {
    //根据用户id获取收货地址列表
    public List<Address> selectAddressById(int uid);
    //为指定用户(id)添加收货地址信息
    public int insertAddress(Address address);
   /* //删除地址信息
    public boolean deleteAddress(int addressid);*/
   //用户根据地址id删除用户地址
   public void deleteAddressByAddressid(int addressid);
}
