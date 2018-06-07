
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

    //根据商品编号，分类查询商品信息
    @RequestMapping(value = "/glist.action",method={RequestMethod.POST, RequestMethod.GET})
    public void main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId=request.getParameter("categoryid");
        int category=Integer.parseInt(categoryId);
        request.setAttribute("glist",goodService.getGoods(category));
        request.getRequestDispatcher("/jsp/product_list.jsp").forward(request,response);
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

    @RequestMapping(value = "/order.action",method={RequestMethod.POST, RequestMethod.GET})
    public String save (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            ForumUser user=(ForumUser)request.getSession().getAttribute("user");
            if(user==null){
                return "/jsp/loginregister.jsp";
            }
            Cart cart = (Cart) request.getSession().getAttribute("cart");
            Order order=new Order();
            order.setOrderid( Integer.parseInt(new java.text.DecimalFormat("0").format((Math.ceil((Math.random())*1000000000)))));
            order.setOrdertime(new Date());
            order.setTotal(cart.getTotalprice());
            order.setState(0);
            order.setUser(new ForumUser(user.getUid(),user.getUname(),user.getPassword()));
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
            List<Address> addressList=addressService.selectAddressById(user.getUid());
            request.getSession().setAttribute("addressList",addressList);
            request.getRequestDispatcher("/jsp/order_address.jsp").forward(request,response);
            return null;
    }
    //取消订单
    @RequestMapping(value = "/deleteOrder.action",method={RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody int deleteOrderByOrderId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        int result = orderService.deleteOrderByOrderId(orderid);
        /*request.getRequestDispatcher("/goods/order.action").forward(request,response);*/
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
    @RequestMapping(value = "/address.action",method={RequestMethod.POST, RequestMethod.GET})
    public String insertAddress(HttpServletRequest request, HttpServletResponse response){
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        String address=request.getParameter("address");
        String addressdetail=request.getParameter("addressdetail");
        String receivename=request.getParameter("receivename");
        String receivetel=request.getParameter("receivetel");
        Address address1=new Address(address,addressdetail,receivename,receivetel,user.getUid());
        int row=addressService.insertAddress(address1);
        String result = "none";
        if(row == 1){
            result="true";
        }else{
            result="false";
        }
        //return "/jsp/order_address.jsp";
        return null;
    }
    /*//用户删除地址
    @RequestMapping(value = "/deleteAddress.action",method={RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody int deleteAddressByAddressid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressid=Integer.parseInt(request.getParameter("addressid"));
        int flag = addressService.removeAddress(addressid);
        if (flag == 1) {
            System.out.println("取消地址成功");
            return flag;
        } else {
            System.out.println("取消地址失败");
            return 0;
        }

    }*/
    @RequestMapping(value = "/deleteAddress.action",method={RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody int deleteAddressByAddressid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println(request.getParameter("addressid"));
        int addressid=Integer.parseInt(request.getParameter("addressid"));
        int flag = addressService.deleteAddressByAddressid(addressid);
        return flag;

    }
}

