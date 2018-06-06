package meiHu.entity;
//购物项实体类
public class CartItem {
    private Goods good;
    private Double subtotal;//小计
    private Integer count;//数量

    public CartItem() {
    }

    public CartItem(Goods good, Integer count) {
        this.good = good;
        this.count = count;
    }

    public Goods getGood() {
        return good;
    }

    public void setGood(Goods good) {
        this.good = good;
    }

    public Double getSubtotal() {
        return good.getGoodprice()*count;
    }

    public void setSubtotal(Double subtotal) {
        this.subtotal = subtotal;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }
}
