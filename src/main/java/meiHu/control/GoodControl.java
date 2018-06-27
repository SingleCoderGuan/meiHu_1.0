package meiHu.control;

import com.alipay.config.*;
/*import com.alipay.api.*;
import com.alipay.api.request.*;*/
import com.github.pagehelper.PageInfo;
import meiHu.entity.*;
import meiHu.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import java.text.DecimalFormat;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

//商城前台control层:商品，购物车，订单（订单状态，订单详情退款状态），地址，支付，优惠券，退款
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
    @RequestMapping(value = "/glist.action", method = {RequestMethod.POST, RequestMethod.GET})
    public void main(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("categoryid");
        int category = Integer.parseInt(categoryId);
        request.setAttribute("glist", goodService.getGoods(category));
        request.getRequestDispatcher("/jsp/product_list.jsp").forward(request, response);
    }

    //根据商品编号，分类查询商品,商品浏览
    @RequestMapping(value = "/glists.action", method = {RequestMethod.POST, RequestMethod.GET})
    public void goods(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categoryId = request.getParameter("categoryid");
        int category = Integer.parseInt(categoryId);
        request.setAttribute("glists", goodService.getGoods(category));
        request.getRequestDispatcher("/jsp/product_lists.jsp").forward(request, response);
    }

    //查看商品详情，并显示相关推荐商品
    @RequestMapping(value = "/list.action", method = {RequestMethod.POST, RequestMethod.GET})
    public void product(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String goodId = request.getParameter("goodid");
        int goodid = Integer.parseInt(goodId);
        int categoryId = goodService.getCategoryByGid(goodid);
        List<Goods> recommendGoods = goodService.showRecommend(categoryId);
        request.setAttribute("recommendGoodsList", recommendGoods);
        request.setAttribute("product", goodService.getGood(goodid));
        request.getRequestDispatcher("/jsp/product.jsp").forward(request, response);
    }

    //商品加入购物车,并显示热卖产品
    @RequestMapping(value = "/cart.action", method = {RequestMethod.POST, RequestMethod.GET})
    public void addCart(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int gid = Integer.parseInt(request.getParameter("gid"));
        int count = Integer.parseInt(request.getParameter("count"));
        Goods good = goodService.getGood(gid);
        CartItem cartItem = new CartItem(good, count);
        Cart cart = getCart(request);
        cart.addCart(cartItem);
        int categoryId = goodService.getCategoryByGid(gid);
        List<Goods> hotSaleGoods = goodService.showHotSale(categoryId);
        request.setAttribute("hotSaleGoodsList", hotSaleGoods);
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
    }

    //在购物车中移除商品
    @RequestMapping(value = "/removecart.action", method = {RequestMethod.POST, RequestMethod.GET})
    public String remove(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getCart(request).removeCart(request.getParameter("gid"));
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
        return null;
    }

    //清除购物车
    @RequestMapping(value = "/removeAllCart.action", method = {RequestMethod.POST, RequestMethod.GET})
    public String removeAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        getCart(request).clearCart();
        request.getRequestDispatcher("/jsp/cart.jsp").forward(request, response);
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
    @RequestMapping(value = "/order.action", method = {RequestMethod.POST, RequestMethod.GET})
    public String save(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        if (user == null) {
            return "/jsp/loginregister.jsp";
        }
        Cart cart = (Cart) request.getSession().getAttribute("cart");
        Order order = new Order();
        int orderid = Math.abs(UUID.randomUUID().toString().hashCode());
        order.setOrderid(orderid);
        order.setOrdertime(new Date());
        order.setTotal(cart.getTotalprice());
        order.setState(0);
        order.setUser(new ForumUser(user.getUid(), user.getUname(), user.getPassword()));
        for (CartItem ci : cart.getCartItems()) {
            OrderItem oi = new OrderItem();
            oi.setItemid(Math.abs(UUID.randomUUID().toString().hashCode()));
            oi.setCount(ci.getCount());
            oi.setSubtotal(ci.getSubtotal());
            oi.setItem_state(0);
            oi.setGood(ci.getGood());
            oi.setOrder(order);
            order.getItems().add(oi);
        }
        orderService.save(order);
        request.getSession().setAttribute("order", order);
        int uid = user.getUid();
        List<Address> addressList = addressService.selectAddressById(uid);
        request.getSession().setAttribute("addressList", addressList);
        request.setAttribute("userofflist", exchangeService.selectAllOffByUid(uid));
        request.getRequestDispatcher("/jsp/order_address.jsp").forward(request, response);
        return null;
    }

    //取消订单
    @RequestMapping(value = "/deleteOrder.action", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    int deleteOrderByOrderId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        System.out.println(orderid);
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
    @RequestMapping(value = "/myOrder.action", method = {RequestMethod.POST, RequestMethod.GET})
    public String findMyOrders(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        if (user == null) {
            return "/jsp/loginregister.jsp";
        }
        int uid = user.getUid();
        Map<String, Object> cmap = new HashMap<>();
        //每页显示的条数
        int pageSize = 5;
        //当前的页面默认是首页
        int curPage = 1;
        String scurPage = request.getParameter("curPage");
        if (scurPage != null && !scurPage.trim().equals("")) {
            curPage = Integer.parseInt(scurPage);
        }
        cmap.put("curPage", curPage);
        cmap.put("pageSize", pageSize);
        PageInfo<Order> pageInfo = orderService.getAllOrderByPage(uid, cmap);
        request.getSession().setAttribute("pageInfo", pageInfo);
        request.getRequestDispatcher("/jsp/mh-order.jsp").forward(request, response);
        return null;
    }

    //查询待付款的订单
    @RequestMapping(value = "/noPayOrder.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectNoPayOrderByUid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        if (user == null) {
            return "/jsp/loginregister.jsp";
        }
        List<Order> noPayOrderList = orderService.noPayOrder(user.getUid());
        request.getSession().setAttribute("noPayOrderList", noPayOrderList);
        request.getRequestDispatcher("/jsp/mh-nopay-money.jsp").forward(request, response);
        return null;
    }

    //查询待发货的订单
    @RequestMapping(value = "/waitOrder.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String waitOrderByUid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        if (user == null) {
            return "/jsp/loginregister.jsp";
        }
        List<Order> waitOrderList = orderService.waitOrder(user.getUid());
        request.getSession().setAttribute("waitOrderList", waitOrderList);
        request.getRequestDispatcher("/jsp/mh-waitsent.jsp").forward(request, response);
        return null;
    }

    //查询待收货的订单
    @RequestMapping(value = "/runOrder.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectRunOrderByUid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        if (user == null) {
            return "/jsp/loginregister.jsp";
        }
        List<Order> runOrderList = orderService.getRunOrder(user.getUid());
        request.getSession().setAttribute("runOrderList", runOrderList);
        request.getRequestDispatcher("/jsp/mh-runorder.jsp").forward(request, response);
        return null;
    }

    //查询已完成的订单
    @RequestMapping(value = "/doneOrder.action", method = {RequestMethod.GET, RequestMethod.POST})
    public String selectDoneOrderByUid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        if (user == null) {
            return "/jsp/loginregister.jsp";
        }
        List<Order> doneOrderList = orderService.getDoneOrder(user.getUid());
        request.getSession().setAttribute("doneOrderList", doneOrderList);
        request.getRequestDispatcher("/jsp/mh-doneorder.jsp").forward(request, response);
        return null;
    }

    //用户确认收货
    @RequestMapping(value = "/querenshouhuo.action", method = {RequestMethod.GET, RequestMethod.POST})
    public @ResponseBody
    int querenshouhuo(HttpServletRequest request, HttpServletResponse response) {
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        int msg = orderService.updateOrderStateWeiWanCheng(orderid);
        return msg;
    }

    //显示用户个人地址
    @RequestMapping(value = "/showAddress.action", method = {RequestMethod.GET, RequestMethod.POST})
    public void showAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        int uid = user.getUid();
        List<Address> addressList = addressService.selectAddressById(uid);
        request.getSession().setAttribute("addressList", addressList);
        request.getRequestDispatcher("/jsp/uc-address.jsp").forward(request, response);
    }

    //用户新增地址
    @RequestMapping(value = "/insertAddress.action", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    Address insertAddress(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        String address = request.getParameter("address");
        String addressdetail = request.getParameter("addressdetail");
        String receivename = request.getParameter("receivename");
        String receivetel = request.getParameter("receivetel");
        int uid = user.getUid();
        Address address1 = new Address(address, addressdetail, receivename, receivetel, uid);
        int row = addressService.insertAddress(address1);
        return address1;
    }

    //删除用户个人地址
    @RequestMapping(value = "/deleteAddress.action", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    int deleteAddressByAddressid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int addressid = Integer.parseInt(request.getParameter("addressid"));
        int flag = addressService.deleteAddressByAddressid(addressid);
        return flag;
    }

    //根据用户id查询用户所拥有的优惠券
    @RequestMapping(value = "/selectDiscount.action", method = {RequestMethod.GET, RequestMethod.POST})
    public void selectDiscountByUid(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        if (user == null) {
            request.getRequestDispatcher("/jsp/loginregister.jsp").forward(request, response);
        } else {
            List<UserOff> userOffList = exchangeService.selectAllOffByUid(user.getUid());
            request.setAttribute("userOffList", userOffList);
            request.getRequestDispatcher("/jsp/mh-discount-coupon.jsp").forward(request, response);
        }
    }

    //处理退款
    @RequestMapping(value = "/drawback.action", method = {RequestMethod.POST, RequestMethod.GET})
    public void refundOrder(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        Order order = orderService.selectOrderById(orderid);
        request.getSession().setAttribute("order", order);
        int itemid = Integer.parseInt(request.getParameter("itemid"));
        OrderItem orderItem = orderService.selectOrderItemById(itemid);
        request.getSession().setAttribute("orderItem", orderItem);
        request.getRequestDispatcher("/jsp/mh-refund.jsp").forward(request, response);
    }

    //用户提交退款订单信息
    @RequestMapping(value = "/refundOrder.action", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    int insertDrawback(HttpServletRequest request, HttpServletResponse response) {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        int uid = user.getUid();
        int itemid = Integer.parseInt(request.getParameter("itemid"));
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        Order order = orderService.selectOrderById(orderid);
        RefundOrder ro = new RefundOrder();
        int drawbackid = Math.abs(UUID.randomUUID().toString().hashCode());
        ro.setDrawbackid(drawbackid);
        ro.setOrder(order);
        ro.setItemid(itemid);
        ro.setUser(new ForumUser(uid, null, null));
        String drawbackreason = request.getParameter("drawbackreason");
        ro.setDrawbackreason(drawbackreason);
        ro.setDrawbacktime(new Date());
        String detail = request.getParameter("detail");
        ro.setDetail(detail);
        ro.setProcessstate(0);
        int result = refundOrderService.insertDrawbackInfo(ro, itemid);
        return result;
    }

    //订单结算页，用户选择地址，完善订单信息
    @RequestMapping(value = "/addAddressIntoOrder.action", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    int addAddressIntoOrder(HttpServletRequest request, HttpServletResponse response) {
        int orderid = Integer.parseInt(request.getParameter("orderId"));
        String addressdetail = request.getParameter("addressdetail");
        String receivename = request.getParameter("receivename");
        String receivetel = request.getParameter("receivetel");
        int result = orderService.addAddrIntoOrderById(orderid, addressdetail, receivename, receivetel);
        return result;
    }

    /*//用户去付款
    @RequestMapping(value = "/alipay.action", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody
    String alipay(HttpServletRequest request, HttpServletResponse response) throws IOException, AlipayApiException {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
        //商户订单号，商户网站订单系统中唯一订单号，必填
        String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"), "UTF-8");
        //付款金额，必填
        double f = Double.parseDouble(request.getParameter("WIDtotal_amount"));
        DecimalFormat df = new DecimalFormat("#.00");
        String total_amount = new String(df.format(f));
        //订单名称，必填
        String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"), "UTF-8");
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //付款之后修改订单状态待付款为待发货
        int orderid = Integer.parseInt(request.getParameter("orderId"));
        orderService.updateOrderState(orderid);
        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        //输出
        return result;
    }*/

    //未付款订单去付款
    @RequestMapping(value = "/daifukuan.action", method = {RequestMethod.POST, RequestMethod.GET})
    public void fukuan(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = (ForumUser) request.getSession().getAttribute("user");
        int uid = user.getUid();
        List<Address> addressList = addressService.selectAddressById(uid);
        request.getSession().setAttribute("addressList", addressList);
        int orderid = Integer.parseInt(request.getParameter("orderid"));
        Order OrderItemLists = orderService.selectYiFuKuanOrderItemLists(orderid);
        request.setAttribute("OrderItemLists", OrderItemLists);
        request.setAttribute("userofflist", exchangeService.selectAllOffByUid(uid));
        request.getRequestDispatcher("/jsp/qufukuan.jsp").forward(request, response);
    }

    //通过订单中商品的名称查询订单
    @RequestMapping(value = "/selectOrderByName.action", method = {RequestMethod.POST, RequestMethod.GET})
    public void selectOrderByName(HttpServletResponse response, HttpServletRequest request) throws IOException, ServletException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String goodname = request.getParameter("goodname");
        System.out.println(goodname);
        List<Order> orderList = orderService.selectOrderByName(goodname);
        request.setAttribute("orderList", orderList);
        System.out.println(orderList.size());
        request.getRequestDispatcher("/jsp/mh-search.jsp").forward(request, response);
    }
}