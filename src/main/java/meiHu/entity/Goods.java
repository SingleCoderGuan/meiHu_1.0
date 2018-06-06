package meiHu.entity;
//商品实体类
public class Goods {
    private Integer goodid;
    private String goodname;
    private String goodpic;
    private Double goodprice;
    private int goodstore;
    private String goodaddress;
    private String gooddetail;
    private int goodsales;
    private GoodsCategory category;

    public Goods() {
    }

    public Goods(Integer goodid, String goodname, String goodpic, Double goodprice, int goodstore, String goodaddress, String gooddetail, int goodsales, GoodsCategory category) {
        this.goodid = goodid;
        this.goodname = goodname;
        this.goodpic = goodpic;
        this.goodprice = goodprice;
        this.goodstore = goodstore;
        this.goodaddress = goodaddress;
        this.gooddetail = gooddetail;
        this.goodsales = goodsales;
        this.category = category;
    }

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
        this.goodname = goodname;
    }

    public String getGoodpic() {
        return goodpic;
    }

    public void setGoodpic(String goodpic) {
        this.goodpic = goodpic;
    }

    public Double getGoodprice() {
        return goodprice;
    }

    public void setGoodprice(Double goodprice) {
        this.goodprice = goodprice;
    }

    public int getGoodstore() {
        return goodstore;
    }

    public void setGoodstore(int goodstore) {
        this.goodstore = goodstore;
    }

    public String getGoodaddress() {
        return goodaddress;
    }

    public void setGoodaddress(String goodaddress) {
        this.goodaddress = goodaddress;
    }

    public String getGooddetail() {
        return gooddetail;
    }

    public void setGooddetail(String gooddetail) {
        this.gooddetail = gooddetail;
    }

    public int getGoodsales() {
        return goodsales;
    }

    public void setGoodsales(int goodsales) {
        this.goodsales = goodsales;
    }

    public GoodsCategory getCategory() {
        return category;
    }

    public void setCategory(GoodsCategory category) {
        this.category = category;
    }
}