package meiHu.control;

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
import java.util.List;

@Controller
public class ExchangeControl {
    @Autowired
    private ExchangeService exchangeService;
    @Autowired
    private UserService userService;
    @RequestMapping("/exchange.action")
    public void exchange(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("uid")==null){
            List<OffLevel> levelList = exchangeService.selectAllOffLevel();
            request.setAttribute("levelList",levelList);
            request.getRequestDispatcher("jsp/exchange.jsp").forward(request,response);
        }else {
            String uidd = request.getParameter("uid");
            int uid = Integer.parseInt(uidd);
           int point = userService.selectPointByUid(uid);
           request.setAttribute("point", point);
            List<OffLevel> levelList = exchangeService.selectAllOffLevel();
            request.setAttribute("levelList", levelList);
            request.getRequestDispatcher("jsp/exchange.jsp").forward(request, response);
        }

    }
@RequestMapping("/duihuan.action")
    public void duihuan(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uidd = request.getParameter("uidd");
        int uid = Integer.parseInt(uidd);
        String pointt = request.getParameter("pointt");
        int point = Integer.parseInt(pointt);
        String offidd = request.getParameter("offidd");

        int offid = Integer.parseInt(offidd);
        int needpoint = exchangeService.selectOffLevelByOffid(offid).getNeedpoint();
        PrintWriter out = response.getWriter();
        if(needpoint>point){
            out.print(0);
        }else{
            if(exchangeService.selectOffIntoUser(uid,offid)==null){
                exchangeService.addOffIntoUser(uid,offid,1);
                exchangeService.deleteOffByOffid(offid);//兑换券总数数量更新
                exchangeService.updateUserPoint(uid,needpoint);
                out.print(1);
            }
            else {
                exchangeService.addUserOffNum(uid,offid);
                exchangeService.deleteOffByOffid(offid);
                exchangeService.updateUserPoint(uid,needpoint);
                out.print(1);
            }
        }

    }
}
