package meiHu.entity;
////商品分类实体类
public class GoodsCategory {
    private Integer categoryid;
    private String categoryname;

    public GoodsCategory() {
    }

    public Integer getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(Integer categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategoryname() {
        return categoryname;
    }

    public void setCategoryname(String categoryname) {
        this.categoryname = categoryname;
    }
}
