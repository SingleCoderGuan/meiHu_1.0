package meiHu.control;

import com.github.pagehelper.PageInfo;
import meiHu.entity.Goods;
import meiHu.entity.Order;
import meiHu.entity.RefundOrder;
import meiHu.service.OrderService;
import meiHu.service.RefundOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//商城后台管理员control层:退款管理，订单管理
@RequestMapping("/shopAdminManage")
@Controller
public class ShopAdminODControl {
    @Autowired
    private RefundOrderService refundOrderService;
    @Autowired
    private OrderService orderService;
    //管理员查看所有退款订单
    @RequestMapping(value = "/selectDrawbackInfo.action", method = {RequestMethod.POST, RequestMethod.GET})
    public void showDrawbackInfos(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<RefundOrder> refundOrders = refundOrderService.selectDrawbackInfo();
        request.setAttribute("refundLists", refundOrders);
        request.getRequestDispatcher("/admin/tuikuan.jsp").forward(request, response);
    }
    //管理员接受用户的退款
    @RequestMapping(value = "/updateDrawbackState.action", method = {RequestMethod.POST, RequestMethod.GET})
    public @ResponseBody int updateDrawback(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int drawbackid=Integer.parseInt(request.getParameter("drawbackid"));
        int itemid=Integer.parseInt(request.getParameter("itemid"));
        int result = refundOrderService.updateDrawbackInfo(drawbackid,itemid);
        return result;
    }
    //管理员查看所有的订单
    @RequestMapping(value = "/selectYiFuKuanOrder.action",method = {RequestMethod.POST,RequestMethod.GET})
    public void selectYiFuKuanOrder(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Map<String ,Object> cmap=new HashMap<>();
        //每页显示的条数
        int pageSize=10;
        //当前的页面默认是首页
        int curPage=1;
        String scurPage=request.getParameter("curPage");
        if (scurPage!=null&&!scurPage.trim().equals("")){

            curPage=Integer.parseInt(scurPage);
        }
        cmap.put("curPage",curPage);
        cmap.put("pageSize",pageSize);


        PageInfo<Order> pageInfo=orderService.selectYiFuKuanOrderListsByPage(cmap);

        request.setAttribute("pageInfo",pageInfo);


        /*List<Order> yifukuanOrderLists=orderService.selectYiFuKuanOrderLists();
        request.setAttribute("YiFuKuanOrderLists",yifukuanOrderLists);*/
        request.getRequestDispatcher("/admin/dingdanlist.jsp").forward(request,response);
    }
    //管理员查看订单详情
    @RequestMapping(value = "/selectYiFuKuanOrderItem.action",method = {RequestMethod.POST,RequestMethod.GET})
    public void selectYiFuKuanOrderItem(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        int orderid=Integer.parseInt(request.getParameter("orderid"));
        Order yifukuanOrderItemLists=orderService.selectYiFuKuanOrderItemLists(orderid);
        request.setAttribute("YiFuKuanOrderItemLists",yifukuanOrderItemLists);
        request.getRequestDispatcher("/admin/dingdanxiangqing.jsp").forward(request,response);
    }
    //管理员取消用户未付款的订单
    @RequestMapping(value = "/quxiao.action",method = {RequestMethod.POST,RequestMethod.GET})
    public @ResponseBody int quxiao(HttpServletRequest request,HttpServletResponse response) {
        int orderid=Integer.parseInt(request.getParameter("orderid"));
        int msg=orderService.deleteOrderByOrderId(orderid);
        if (msg == 1) {
            return msg;
        } else {
            return 0;
        }
    }
    //管理员安排发货
    @RequestMapping(value = "/fahuo.action",method = {RequestMethod.POST,RequestMethod.GET})
    public @ResponseBody int fahuo(HttpServletRequest request,HttpServletResponse response) {
        int orderid=Integer.parseInt(request.getParameter("orderid"));
        int result=orderService.updateOrderStateWeiFaHuo(orderid);
        return result;
    }
    //管理员修改订单状态待收货为已完成
    @RequestMapping(value = "/wancheng.action",method = {RequestMethod.POST,RequestMethod.GET})
    public @ResponseBody int wancheng(HttpServletRequest request,HttpServletResponse response){
        int orderid=Integer.parseInt(request.getParameter("orderid"));
        int result=orderService.updateOrderStateWeiWanCheng(orderid);
        return result;
    }
    //查询各种不同状态的订单
    @RequestMapping(value = "/selectOrderByState.action",method = {RequestMethod.POST,RequestMethod.GET})
    public void selectOrderByOrderState(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        String state=request.getParameter("orderstate");
        List<Order> OrderLists=orderService.selectOrderByState(state);
        request.setAttribute("YiFuKuanOrderLists",OrderLists);
        request.getRequestDispatcher("/admin/dingdanlistState.jsp").forward(request,response);
    }
}