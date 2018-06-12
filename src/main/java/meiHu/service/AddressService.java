package meiHu.service;

import meiHu.entity.Address;

import java.util.List;

public interface AddressService {

    public List<Address> selectAddressById(int uid);

    public int insertAddress(Address address);

    /*public int removeAddress(int addressid);*/
    public int deleteAddressByAddressid(int addressid);
}
