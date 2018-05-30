package meiHu.entity;

public class ShopGoods {
    private Integer goodid;

    private String goodname;

    private String goodpic;

    private Double goodprice;

    private Integer goodstore;

    private String goodaddress;

    private String gooddetail;

    private Integer goodsales;

    private Integer categoryid;

    public Integer getGoodid() {
        return goodid;
    }

    public void setGoodid(Integer goodid) {
        this.goodid = goodid;
    }

    public String getGoodname() {
        return goodname;
    }

    public void setGoodname(String goodname) {
        this.goodname = goodname == null ? null : goodname.trim();
    }

    public String getGoodpic() {
        return goodpic;
    }

    public void setGoodpic(String goodpic) {
        this.goodpic = goodpic == null ? null : goodpic.trim();
    }

    public Double getGoodprice() {
        return goodprice;
    }

    public void setGoodprice(Double goodprice) {
        this.goodprice = goodprice;
    }

    public Integer getGoodstore() {
        return goodstore;
    }

    public void setGoodstore(Integer goodstore) {
        this.goodstore = goodstore;
    }

    public String getGoodaddress() {
        return goodaddress;
    }

    public void setGoodaddress(String goodaddress) {
        this.goodaddress = goodaddress == null ? null : goodaddress.trim();
    }

    public String getGooddetail() {
        return gooddetail;
    }

    public void setGooddetail(String gooddetail) {
        this.gooddetail = gooddetail == null ? null : gooddetail.trim();
    }

    public Integer getGoodsales() {
        return goodsales;
    }

    public void setGoodsales(Integer goodsales) {
        this.goodsales = goodsales;
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }
}