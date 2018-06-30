package meiHu.control;


import com.github.pagehelper.PageInfo;
import meiHu.entity.*;
import meiHu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RequestMapping("/shopAdmin")
@Controller
public class ShopAdminControl {
    @Autowired
    private RefundOrderService refundOrderService;
    @Autowired
    private GoodService goodService;
    @Autowired
    private GoodsCategoryService goodsCategoryService;
    @RequestMapping(value = "/selectDrawback.action",method = {RequestMethod.POST,RequestMethod.GET})
    public void showDrawbackInfo(HttpServletRequest request,HttpServletResponse response){
       // List<RefundOrder> refundOrders=refundOrderService.
    }

    @RequestMapping(value = "/getAllProducts.action",method = {RequestMethod.POST,RequestMethod.GET})
    public void getAllProducts(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Map<String ,Object> cmap=new HashMap<>();
        //每页显示的条数
        int pageSize=8;
        //当前的页面默认是首页
        int curPage=1;
        String scurPage=request.getParameter("curPage");
        if (scurPage!=null&&!scurPage.trim().equals("")){

            curPage=Integer.parseInt(scurPage);
        }
        cmap.put("curPage",curPage);
        cmap.put("pageSize",pageSize);


        PageInfo<Goods> pageInfo=goodService.getAllProductByPage(cmap);

        request.setAttribute("pageInfo",pageInfo);
        //所有类别
        List<GoodsCategory> categoryList=goodsCategoryService.getAllGoodsCategory();
        request.setAttribute("categoryList",categoryList);
        request.getRequestDispatcher("/admin/goodslist.jsp").forward(request,response);

    }
    @RequestMapping(value = "/goodCategory.action")
    public void  getGoodsByCategory(String categoryId,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int category=Integer.parseInt(categoryId);
        //List<Goods> goodsCategory=goodService.getGoods(category);
        Map<String ,Object> cmap=new HashMap<>();
        //每页显示的条数
        int pageSize=8;
        //当前的页面默认是首页
        int curPage1=1;
        String scurPage=request.getParameter("curPage1");
        if (scurPage!=null&&!scurPage.trim().equals("")){

            curPage1=Integer.parseInt(scurPage);
        }
        cmap.put("curPage1",curPage1);
        cmap.put("pageSize",pageSize);


        PageInfo<Goods> pageInfoCategory=goodService.getGoodsByCategory(category,cmap);

        request.setAttribute("pageInfoCategory",pageInfoCategory);
        System.out.println(pageInfoCategory.getSize());

        List<GoodsCategory> categoryList=goodsCategoryService.getAllGoodsCategory();
        request.setAttribute("categoryList",categoryList);
       // request.setAttribute("allProducts",goodsCategory);
        request.setAttribute("categoryId",category);

        request.getRequestDispatcher("/admin/goodsCategory.jsp").forward(request,response);

    }
    @RequestMapping("/showCategoryLists.action")
    public void showCategoryLists(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        List<GoodsCategory> categoryList=goodsCategoryService.getAllGoodsCategory();
        request.setAttribute("categoryList",categoryList);
        request.getRequestDispatcher("/admin/addgoods.jsp").forward(request,response);
    }
    @RequestMapping(value = "/insertGoods.action",method = {RequestMethod.POST,RequestMethod.GET})
    public void insertGoods(MultipartFile imgFileUp,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Goods gg=new Goods();
        String goodname1=request.getParameter("goodname");

        Double goodprice1=Double.parseDouble(request.getParameter("goodprice"));
        int goodstore1=Integer.parseInt(request.getParameter("goodstore"));
        String goodaddress1=request.getParameter("goodaddress");
        String gooddetail1=request.getParameter("gooddetail");
        int goodsales1=Integer.parseInt(request.getParameter("goodsales"));
        int categoryid1=Integer.parseInt(request.getParameter("categoryId"));
        gg.setGoodname(goodname1);
        //MultipartFile imgFileUp   接收文件选择器上传的文件
        //获取该文件的名字
         String filename=imgFileUp.getOriginalFilename();
        //将文件上传到服务器上  （images 文件夹在服务器上的绝对路径）
        String imgFile=request.getServletContext().getRealPath("images");
        String img=imgFile+"/"+filename;
        File f=new File(img);

        //创建文件
        if(!f.exists()){
            //不存在直接创建
            f.mkdirs();
        }else {
            //存在的话，先删除，在创建
            f.delete();
            f.mkdirs();
        }
        //通过io流将自己电脑上的文件内容一个个读取到服务器上新创建的图片
        imgFileUp.transferTo(f);//图片的复制
        //图片路径发生改变
        gg.setGoodpic("images/"+filename);


        gg.setGoodprice(goodprice1);
        gg.setGoodstore(goodstore1);
        gg.setGoodaddress(goodaddress1);
        gg.setGooddetail(gooddetail1);
        gg.setGoodsales(goodsales1);
        gg.setCategory(new GoodsCategory(categoryid1,null));
        boolean f1=goodService.insertGoods(gg);

        request.getRequestDispatcher("/shopAdmin/getAllProducts.action").forward(request,response);
    }


    @RequestMapping(value = "/updateGoods.action",method = {RequestMethod.GET,RequestMethod.POST})
    public void updateGood(int id,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<GoodsCategory> categoryList=goodsCategoryService.getAllGoodsCategory();
        request.setAttribute("categoryList",categoryList);

        //用户修改商品的最新数据查询 并展示
        Goods goods=goodService.getGood(id);
        System.out.println(id);

        if(goods!=null) {
            //商品存在
            request.setAttribute("good", goods);
            //商品的修改页面

            request.getRequestDispatcher("/admin/updategoods.jsp").forward(request, response);
        }else{

        }


    }


    //只处理post请求
    @RequestMapping(value = "/updateGoodTrue.action",method =RequestMethod.POST)
    public void updateTrue(MultipartFile imgFileUp,Goods goods, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //MultipartFile imgFileUp   接收文件选择器上传的文件
        //获取该文件的名字

        String filename=imgFileUp.getOriginalFilename();

        //将文件上传到服务器上  （images 文件夹在服务器上的绝对路径）
        String imgFile=request.getServletContext().getRealPath("images");
        String img=imgFile+"/"+filename;
        File f=new File(img);

        //创建文件
        if(!f.exists()){
            //不存在直接创建
            f.mkdirs();
        }else {
            //存在的话，先删除，在创建
            f.delete();
            f.mkdirs();
        }
        //通过io流将自己电脑上的文件内容一个个读取到服务器上新创建的图片
        imgFileUp.transferTo(f);//图片的复制

        //图片路径发生改变
        goods.setGoodpic("images/"+filename);

        //调用service层方法
        if(goodService.updateGood(goods)){

           request.getRequestDispatcher("/shopAdmin/getAllProducts.action").forward(request,response);

        }else{
            System.out.println("false");
        }

    }


    @RequestMapping(value = "deleteGood.action",method = {RequestMethod.GET,RequestMethod.POST})
    public void  deleteGoodById(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String goodid=request.getParameter("goodid");
        int goodid1=Integer.parseInt(goodid);
        System.out.println(goodid1);
        if(goodService.deleteGood(goodid1)){
           response.getWriter().print(1);

        }else{
            response.getWriter().print(0);
        }

    }


}
