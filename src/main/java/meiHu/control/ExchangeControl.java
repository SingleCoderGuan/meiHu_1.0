package meiHu.control;

import meiHu.entity.ForumUser;
import meiHu.entity.OffLevel;
import meiHu.service.ExchangeService;
import meiHu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.ref.ReferenceQueue;
import java.util.List;

@Controller
public class ExchangeControl {
    @Autowired
    private ExchangeService exchangeService;
    @Autowired
    private UserService userService;

    @RequestMapping("/exchange.action")
    public void exchange(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            List<OffLevel> levelList = exchangeService.selectAllOffLevel();
            request.setAttribute("levelList", levelList);
            request.getRequestDispatcher("jsp/exchange.jsp").forward(request, response);
        } else {
            ForumUser user = (ForumUser) request.getSession().getAttribute("user");
            int uid = user.getUid();
            int point = userService.selectPointByUid(uid);
            request.setAttribute("point", point);

            List<OffLevel> levelList = exchangeService.selectAllOffLevel();
            request.setAttribute("levelList", levelList);
            request.getRequestDispatcher("jsp/exchange.jsp").forward(request, response);
        }

    }

    @RequestMapping("/duihuan.action")
    public void duihuan(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String uidd = request.getParameter("uidd");
        int uid = Integer.parseInt(uidd);
        String pointt = request.getParameter("pointt");
        int point = Integer.parseInt(pointt);
        String offidd = request.getParameter("offidd");

        int offid = Integer.parseInt(offidd);
        int needpoint = exchangeService.selectOffLevelByOffid(offid).getNeedpoint();
        PrintWriter out = response.getWriter();
        if (needpoint > point) {
            out.print(0);
        } else {
            if (exchangeService.selectOffIntoUser(uid, offid) == null) {
                exchangeService.addOffIntoUser(uid, offid, 1);
                exchangeService.deleteOffByOffid(offid);//兑换券总数数量更新
                exchangeService.updateUserPoint(uid, needpoint);
                out.print(needpoint);
            } else {
                exchangeService.addUserOffNum(uid, offid);
                exchangeService.deleteOffByOffid(offid);
                exchangeService.updateUserPoint(uid, needpoint);
                out.print(needpoint);
            }
        }

    }

    @RequestMapping("quchoujiang.action")
    public void jinruchoujiang(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") != null) {
            ForumUser user = (ForumUser) request.getSession().getAttribute("user");
            int uid = user.getUid();
            int point = userService.selectPointByUid(uid);
            request.setAttribute("point", point);
            request.getRequestDispatcher("/jsp/choujiang.jsp").forward(request, response);
        } else {
            response.sendRedirect("jsp/choujiang.jsp");
        }
    }

    @RequestMapping("/choujiang.action")
    public void choujiang(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        int uid = Integer.parseInt(request.getParameter("uidd"));
        int point = userService.selectPointByUid(uid);
        PrintWriter out = response.getWriter();

        if (point < 50) {
            out.print(1);
        } else {
            out.print(2);
        }
    }

    @RequestMapping("/choujianghou.action")
    public void choujianghou(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int uid = Integer.parseInt(request.getParameter("uidd"));
        int quanid = Integer.parseInt(request.getParameter("jiangli"));

        System.out.println("这里收到的优惠券的id是" + quanid);
        int offid;
        if (quanid == 1 || quanid == 3 || quanid == 6 || quanid == 8) {
            exchangeService.updateUserPoint(uid, 50);
            System.out.println("谢谢惠顾");
        }
        else if (quanid == 2 || quanid == 4 || quanid == 10) {
            offid = 1;
            System.out.println("九折");
            if(exchangeService.selectOffIntoUser(uid,offid)==null){
                exchangeService.addOffIntoUser(uid, offid, 1);
                exchangeService.deleteOffByOffid(offid);//兑换券总数数量更新
                exchangeService.updateUserPoint(uid, 50);
            } else {
                exchangeService.addUserOffNum(uid,offid);
                exchangeService.deleteOffByOffid(offid);
                exchangeService.updateUserPoint(uid,50);
            }
        }
        else if (quanid == 5 || quanid == 9) {
            offid = 5;
            if (exchangeService.selectOffIntoUser(uid, offid) == null) {
                exchangeService.addOffIntoUser(uid, offid, 1);
                exchangeService.deleteOffByOffid(offid);//兑换券总数数量更新
                exchangeService.updateUserPoint(uid, 50);
                System.out.println("zhixingdaozhel");


            } else {
                exchangeService.addUserOffNum(uid, offid);
                exchangeService.deleteOffByOffid(offid);
                exchangeService.updateUserPoint(uid, 50);

            }
            System.out.println("五折");
        }
        else if (quanid == 7) {
            offid = 2;
            if (exchangeService.selectOffIntoUser(uid, offid) == null) {
                exchangeService.addOffIntoUser(uid, offid, 1);
                exchangeService.deleteOffByOffid(offid);//兑换券总数数量更新
                exchangeService.updateUserPoint(uid, 50);


            } else {
                exchangeService.addUserOffNum(uid, offid);
                exchangeService.deleteOffByOffid(offid);
                exchangeService.updateUserPoint(uid, 50);
                System.out.println("zhixingdaozhel");

            }
            System.out.println("八折");
        }
        response.getWriter().print(1);

    }
}
