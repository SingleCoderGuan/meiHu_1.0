package meiHu.entity;

public class ShopAddress {
    private Integer addressid;

    private Integer uid;

    private String address;

    private String addressdetail;

    private String recievename;

    private String receivetel;

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getAddressdetail() {
        return addressdetail;
    }

    public void setAddressdetail(String addressdetail) {
        this.addressdetail = addressdetail == null ? null : addressdetail.trim();
    }

    public String getRecievename() {
        return recievename;
    }

    public void setRecievename(String recievename) {
        this.recievename = recievename == null ? null : recievename.trim();
    }

    public String getReceivetel() {
        return receivetel;
    }

    public void setReceivetel(String receivetel) {
        this.receivetel = receivetel == null ? null : receivetel.trim();
    }
}