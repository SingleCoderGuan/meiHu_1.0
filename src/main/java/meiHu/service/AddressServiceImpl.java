package meiHu.service;

import meiHu.dao.AddressMapper;
import meiHu.entity.Address;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {
    @Autowired
    private AddressMapper addressMapper;
    @Override
    public List<Address> selectAddressById(int uid) {
        return addressMapper.selectAddressById(uid);
    }

    @Override
    public int insertAddress(Address address) {
        return addressMapper.insertAddress(address);
    }
}
