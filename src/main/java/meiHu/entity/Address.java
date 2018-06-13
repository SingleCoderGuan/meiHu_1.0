package meiHu.entity;
//收货地址实体类
public class Address {
    private Integer addressid;
    private String address;
    private String addressdetail;
    private String receivename;
    private String receivetel;
    private Integer uid;

    public Address() {
    }

    public Address(String address, String addressdetail, String receivename, String receivetel, Integer uid) {
        this.address = address;
        this.addressdetail = addressdetail;
        this.receivename = receivename;
        this.receivetel = receivetel;
        this.uid = uid;
    }

    public Integer getAddressid() {
        return addressid;
    }

    public void setAddressid(Integer addressid) {
        this.addressid = addressid;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddressdetail() {
        return addressdetail;
    }

    public void setAddressdetail(String addressdetail) {
        this.addressdetail = addressdetail;
    }

    public String getReceivename() {
        return receivename;
    }

    public void setReceivename(String receivename) {
        this.receivename = receivename;
    }

    public String getReceivetel() {
        return receivetel;
    }

    public void setReceivetel(String receivetel) {
        this.receivetel = receivetel;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "Address{" +
                "addressid=" + addressid +
                ", address='" + address + '\'' +
                ", addressdetail='" + addressdetail + '\'' +
                ", receivename='" + receivename + '\'' +
                ", receivetel='" + receivetel + '\'' +
                ", uid=" + uid +
                '}';
    }
}
