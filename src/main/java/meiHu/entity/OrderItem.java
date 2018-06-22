package meiHu.entity;
//订单项实体类
public class OrderItem {
    private Integer itemid;
    private Integer count;
    private double subtotal;
    private Integer item_state;//用于之后的退款使用，0表示正常完成，不需退款，1表示用户申请退款，管理员未作处理，2表示管理员同意退款
    private Goods good;
    private Order order;

    public OrderItem() {
    }

    public Integer getItem_state() {
        return item_state;
    }

    public void setItem_state(Integer item_state) {
        this.item_state = item_state;
    }

    public Integer getItemid() {
        return itemid;
    }

    public void setItemid(Integer itemid) {
        this.itemid = itemid;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public double getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(double subtotal) {
        this.subtotal = subtotal;
    }

    public Goods getGood() {
        return good;
    }

    public void setGood(Goods good) {
        this.good = good;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }
}
