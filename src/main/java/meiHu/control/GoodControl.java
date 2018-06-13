
package meiHu.control;

import meiHu.entity.*;
import meiHu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;


@RequestMapping("/goods")
@Controller
public class GoodControl {
    @Autowired
    private GoodService goodService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private AddressService addressService;
    @Autowired
    private ExchangeService exchangeService;
    @Autowired
    private RefundOrderService refundOrderService;

    //根据商品编号，分类查询商品信息
    @RequestMapping(value = "/glist.action",method={RequestMethod.POST, RequestMethod.GET})
    public void main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId=request.getParameter("categoryid");
        int category=Integer.parseInt(categoryId);
        request.setAttribute("glist",goodService.getGoods(category));
        request.getRequestDispatcher("/jsp/product_list.jsp").forward(request,response);
    }
    //根据商品编号，分类查询商品,商品浏览
    @RequestMapping(value = "/glists.action",method={RequestMethod.POST, RequestMethod.GET})
    public void goods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId=request.getParameter("categoryid");
        int category=Integer.parseInt(categoryId);
        request.setAttribute("glists",goodService.getGoods(category));
        request.getRequestDispatcher("jsp/product_lists.jsp").forward(request,response);
    }
    //查看商品详情
    @RequestMapping(value = "/list.action",method={RequestMethod.POST, RequestMethod.GET})
    public void product(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String goodId=request.getParameter("goodid");
        int goodid=Integer.parseInt(goodId);
        request.setAttribute("product",goodService.getGood(goodid));
        request.getRequestDispatcher("/jsp/product.jsp").forward(request,response);
    }
    //商品加入购物车
    @RequestMapping(value="/cart.action",method={RequestMethod.POST, RequestMethod.GET})
    public void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gid = Integer.parseInt(request.getParameter("gid"));
        int count = Integer.parseInt(request.getParameter("count"));
        Goods good = goodService.getGood(gid);
        CartItem cartItem = new CartItem(good, count);
        Cart cart = getCart(request);
        cart.addCart(cartItem);
        try {
            request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("加入购物车失败");
        }

    }
    //在购物车中移除商品
    @RequestMapping(value = "/removecart.action",method={RequestMethod.POST, RequestMethod.GET})
    public String remove (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getCart(request).removeCart(request.getParameter("gid"));
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request,response);
        return null;
    }
    //清除购物车
    @RequestMapping(value = "/removeAllCart.action",method={RequestMethod.POST, RequestMethod.GET})
    public String removeAll (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getCart(request).clearCart();
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request,response);
        return null;
    }
    //在session中取出cart
    private Cart getCart(HttpServletRequest request) {
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        if (cart == null) {
            cart = new Cart();
            request.getSession().setAttribute("cart", cart);
        }
        return cart;
    }
    //生成订单并浏览出用户个人地址
    @RequestMapping(value = "/order.action",method={RequestMethod.POST, RequestMethod.GET})
    public String save (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        if(user==null){
            return "/jsp/loginregister.jsp";
        }
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Order order=new Order();
        int orderid=Math.abs(UUID.randomUUID().toString().hashCode());
        order.setOrderid(orderid);
        order.setOrdertime(new Date());
        order.setTotal(cart.getTotalprice());
        order.setState(0);
        order.setUser(new ForumUser(user.getUid(),user.getUname(),user.getPassword()));
        for(CartItem ci:cart.getCartItems()){
            OrderItem oi=new OrderItem();
            oi.setItemid(Math.abs(UUID.randomUUID().toString().hashCode()));
            oi.setCount(ci.getCount());
            oi.setSubtotal(ci.getSubtotal());
            oi.setGood(ci.getGood());
            oi.setOrder(order);
            order.getItems().add(oi);
        }
        orderService.save(order);
        request.getSession().setAttribute("order",order);
        int uid=user.getUid();
        List<Address> addressList=addressService.selectAddressById(uid);
        request.getSession().setAttribute("addressList",addressList);
        request.getRequestDispatcher("/jsp/order_address.jsp").forward(request,response);
        return null;
    }
    //取消订单
    @RequestMapping(value = "/deleteOrder.action",method={RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody int deleteOrderByOrderId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        int result = orderService.deleteOrderByOrderId(orderid);
        if (result == 1) {
            System.out.println("取消订单成功");
            return result;
        } else {
            System.out.println("取消订单失败");
            return 0;
        }
    }
    //查看我的订单
    @RequestMapping(value = "/myOrder.action",method={RequestMethod.POST, RequestMethod.GET})
    public String findMyOrders (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        if(user==null){
            return "/jsp/loginregister.jsp";
        }
        int  uid = user.getUid() ;
        List<Order> orderList =orderService.getOrderByUid(uid);
        request.getSession().setAttribute("orderList",orderList);
        request.getRequestDispatcher("/jsp/mh-order.jsp").forward(request,response);
        return null;
    }
    //查询未付款的订单
    @RequestMapping(value ="/noPayOrder.action",method = {RequestMethod.GET, RequestMethod.POST})
    public String selectNoPayOrderByUid (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        if(user==null){
            return "/jsp/loginregister.jsp";
        }
        List<Order> noPayOrderList =orderService.noPayOrder(user.getUid());
        request.getSession().setAttribute("noPayOrderList",noPayOrderList);
        request.getRequestDispatcher("/jsp/mh-nopay-money.jsp").forward(request,response);
        return null;
    }
    //查询等待发货的订单
    @RequestMapping(value ="/waitOrder.action",method = {RequestMethod.GET, RequestMethod.POST})
    public String waitOrderByUid (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        if(user==null){
            return "/jsp/loginregister.jsp";
        }
        List<Order> waitOrderList =orderService.waitOrder(user.getUid());
        request.getSession().setAttribute("waitOrderList",waitOrderList);
        request.getRequestDispatcher("/jsp/mh-waitsent.jsp").forward(request,response);
        return null;
    }
    //查询已经发货的订单
    @RequestMapping(value ="/runOrder.action",method = {RequestMethod.GET, RequestMethod.POST})
    public String selectRunOrderByUid (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        if(user==null){
            return "/jsp/loginregister.jsp";
        }
        List<Order> runOrderList =orderService.getRunOrder(user.getUid());
        request.getSession().setAttribute("runOrderList",runOrderList);
        request.getRequestDispatcher("/jsp/mh-runorder.jsp").forward(request,response);
        return null;
    }
    //查询已完成的订单
    @RequestMapping(value ="/doneOrder.action",method = {RequestMethod.GET, RequestMethod.POST})
    public String selectDoneOrderByUid (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        if(user==null){
            return "/jsp/loginregister.jsp";
        }
        List<Order> doneOrderList =orderService.getDoneOrder(user.getUid());
        request.getSession().setAttribute("doneOrderList",doneOrderList);
        request.getRequestDispatcher("/jsp/mh-doneorder.jsp").forward(request,response);
        return null;
    }
    //用户新增地址
    @RequestMapping(value = "/insertAddress.action",method={RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody Address insertAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        String address=request.getParameter("address");
        String addressdetail=request.getParameter("addressdetail");
        String receivename=request.getParameter("receivename");
        String receivetel=request.getParameter("receivetel");
        int uid=user.getUid();
        Address address1=new Address(address,addressdetail,receivename,receivetel,uid);
        int row=addressService.insertAddress(address1);
        System.out.println("12345");
        return address1;
    }
    //删除用户个人地址
    @RequestMapping(value = "/deleteAddress.action",method={RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody int deleteAddressByAddressid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressid=Integer.parseInt(request.getParameter("addressid"));
        int flag = addressService.deleteAddressByAddressid(addressid);
        return flag;
    }
    //根据用户id查询用户所拥有的优惠券
    @RequestMapping(value = "/selectDiscount.action",method = {RequestMethod.GET,RequestMethod.POST})
    public void selectDiscountByUid(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        if(user==null){
            request.getRequestDispatcher("/jsp/loginregister.jsp").forward(request,response);
        }else{
            List<UserOff> userOffList =exchangeService.selectAllOffByUid(user.getUid());
            request.setAttribute("userOffList",userOffList);
            request.getRequestDispatcher("/jsp/mh-discount-coupon.jsp").forward(request,response);
        }
    }
    //处理退款
    @RequestMapping(value = "/drawback.action",method = {RequestMethod.POST,RequestMethod.GET})
    public void refundOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int orderid=Integer.parseInt(request.getParameter("orderid"));
        Order order=orderService.selectOrderById(orderid);
        request.getSession().setAttribute("order",order);
        int itemid=Integer.parseInt(request.getParameter("itemid"));
        OrderItem orderItem=orderService.selectOrderItemById(itemid);
        request.getSession().setAttribute("orderItem",orderItem);
        request.getRequestDispatcher("/jsp/mh-refund.jsp").forward(request,response);
    }
    //用户提交退款订单信息
    @RequestMapping(value = "/refundOrder.action",method = {RequestMethod.POST,RequestMethod.GET})
    public @ResponseBody int insertDrawback(HttpServletRequest request,HttpServletResponse response){
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        int uid=user.getUid();
        int orderid=Integer.parseInt(request.getParameter("orderid"));
        Order order=orderService.selectOrderById(orderid);
        RefundOrder ro=new RefundOrder();
        int drawbackid=Math.abs(UUID.randomUUID().toString().hashCode());
        ro.setDrawbackid(drawbackid);
        ro.setOrder(order);
        ro.setUser(new ForumUser(uid,null,null));
        String drawbackreason=request.getParameter("drawbackreason");
        ro.setDrawbackreason(drawbackreason);
        ro.setDrawbacktime(new Date());
        String detail=request.getParameter("detail");
        ro.setDetail(detail);
        ro.setProcessstate("0");
        int result=refundOrderService.insertDrawbackInfo(ro);
        return result;
    }
}

