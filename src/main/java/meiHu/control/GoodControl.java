
package meiHu.control;

import meiHu.entity.*;
import meiHu.service.AddressService;
import meiHu.service.GoodService;
import meiHu.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.List;


@RequestMapping("/goods")
@Controller
public class GoodControl {  
    @Autowired
    private GoodService goodService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private AddressService addressService;


    @RequestMapping(value = "/glist.action",method={RequestMethod.POST, RequestMethod.GET})
    public void main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId=request.getParameter("categoryid");
        int category=Integer.parseInt(categoryId);
        request.setAttribute("glist",goodService.getGoods(category));
        request.getRequestDispatcher("/jsp/product_list.jsp").forward(request,response);
    }
    @RequestMapping(value = "/list.action",method={RequestMethod.POST, RequestMethod.GET})
    public void product(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String goodId=request.getParameter("goodid");
        int goodid=Integer.parseInt(goodId);
        request.setAttribute("product",goodService.getGood(goodid));
        request.getRequestDispatcher("/jsp/product.jsp").forward(request,response);
    }
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
    @RequestMapping(value = "/removecart.action",method={RequestMethod.POST, RequestMethod.GET})
    public String remove (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getCart(request).removeCart(request.getParameter("gid"));
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request,response);
        return null;
    }

    @RequestMapping(value = "/removeAllCart.action",method={RequestMethod.POST, RequestMethod.GET})
    public String removeAll (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getCart(request).clearCart();
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request,response);
        return null;
    }
    private Cart getCart(HttpServletRequest request) {
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            if (cart == null) {
                cart = new Cart();
                request.getSession().setAttribute("cart", cart);
            }
            return cart;
        }

        @RequestMapping(value = "/order.action",method={RequestMethod.POST, RequestMethod.GET})
        public String save (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            /*ForumUser user=(ForumUser)request.getSession().getAttribute("user");
            if(user==null){
                request.setAttribute("msg","请先登录");
                request.getRequestDispatcher("/jsp/msg.jsp");
            }*/
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            Order order=new Order();
            Integer WEI_FUKUAN=0;//未付款
            Integer YI_FUKUAN=1;//已付款
            Integer YI_FAHUO=2;//已发货
            Integer YI_WANCHENG=3;//已完成
            order.setOrderid( Integer.parseInt(new java.text.DecimalFormat("0").format((Math.ceil((Math.random())*1000000000)))));
            order.setOrdertime(new Date());
            order.setTotal(cart.getTotalprice());
           // order.getState(WEI_FUKUAN);
            //order.setUser(new ForumUser(100,"123","123"));
            for(CartItem ci:cart.getCartItems()){
                OrderItem oi=new OrderItem();
                oi.setItemid(Integer.parseInt(new java.text.DecimalFormat("0").format((Math.ceil((Math.random())*1000)))));
                oi.setCount(ci.getCount());
                oi.setSubtotal(ci.getSubtotal());
                oi.setGood(ci.getGood());
                oi.setOrder(order);
                order.getItems().add(oi);
            }
            orderService.save(order);
            request.getSession().setAttribute("order",order);
            List<Address> addressList=addressService.selectAddressById(101);
            request.getSession().setAttribute("addressList",addressList);
            request.getRequestDispatcher("/jsp/order_address.jsp").forward(request,response);
            return null;
    }
    @RequestMapping(value = "/myOrder.action",method={RequestMethod.POST, RequestMethod.GET})
    public String findMyOrders (/*@RequestParam(value="uid",required=true) int uid,*/HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        /*ForumUser user=(ForumUser)request.getSession().getAttribute("user");
            if(user==null){
                request.setAttribute("msg","请先登录");
                request.getRequestDispatcher("/jsp/msg.jsp");
            }*/
       // int uid=Integer.parseInt(request.getParameter("uid"));
        List<Order> orderList =orderService.getOrderByUid(101);
        request.getSession().setAttribute("orderList",orderList);
        request.getRequestDispatcher("/jsp/myorder_list.jsp").forward(request,response);
        return null;
    }
    @RequestMapping(value = "/address.action",method={RequestMethod.POST, RequestMethod.GET})
    public String insertAddress(HttpServletRequest request, HttpServletResponse response){
       //int uid=Integer.parseInt(request.getParameter("uid"));
       String address=request.getParameter("address");
       String addressdetail=request.getParameter("addressdetail");
       String receivename=request.getParameter("receivename");
       String receivetel=request.getParameter("receivetel");
       Address address1=new Address(address,addressdetail,receivename,receivetel,101);
       int row=addressService.insertAddress(address1);
       String result = "none";
       if(row == 1){
            result="true";
        }else{
            result="false";
        }
        return "/jsp/order_address.jsp";
    }
    @RequestMapping(value = "/deleteOrder.action",method={RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    int deleteOrderByOrderId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderid=Integer.parseInt(request.getParameter("orderid"));
        int result = orderService.deleteOrderByOrderId(orderid);
        request.getRequestDispatcher("/goods/order.action").forward(request,response);
        return result;
    }


    //查询已经发货的订单
    @RequestMapping(value ="/runOrder.action",method = {RequestMethod.GET, RequestMethod.POST})
    public void selectRunOrderByUid (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     /*   int userid=Integer.parseInt(request.getParameter("uid"));*/
        List<Order> runOrderList =orderService.getRunOrder(101);
        System.out.println(runOrderList+"--------------");
        request.getSession().setAttribute("runOrderList",runOrderList);
        request.getRequestDispatcher("/jsp/uc-runorder.jsp").forward(request,response);
    }
}

