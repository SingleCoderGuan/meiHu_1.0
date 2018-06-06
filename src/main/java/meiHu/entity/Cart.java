package meiHu.entity;
//购物车实体类
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Cart {
    private Integer carid;
    private Map<String,CartItem> itemMap=new HashMap<String,CartItem>();
    private double totalprice=0.0;

    public Cart() {
    }

    public Integer getCarid() {
        return carid;
    }

    public void setCarid(Integer carid) {
        this.carid = carid;
    }

    public Map<String, CartItem> getItemMap() {
        return itemMap;
    }

    public void setItemMap(Map<String, CartItem> itemMap) {
        this.itemMap = itemMap;
    }

    public double getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(double totalprice) {
        this.totalprice = totalprice;
    }
    public Collection<CartItem> getCartItems(){
        return itemMap.values();
    }
    //清空购物车
    public void clearCart(){
        itemMap.clear();
        totalprice=0.0;
    }
    //将商品从购物车移除
    public void removeCart(String gid){
        CartItem item=itemMap.remove(gid);
        totalprice=totalprice-item.getSubtotal();
    }
    //将商品添加进购物车
    public void addCart(CartItem item){
        String gid=Integer.toString(item.getGood().getGoodid());
        if(itemMap.containsKey(gid)){
            CartItem oitem=itemMap.get(gid);
            oitem.setCount(oitem.getCount()+item.getCount());
        }else{
            itemMap.put(gid,item);
        }
        totalprice+=item.getSubtotal();
    }

}
