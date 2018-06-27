package meiHu.control;

import meiHu.entity.Favor;
import meiHu.entity.ForumUser;
import meiHu.service.FavorGoodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;


@Controller
@RequestMapping("/favor")
public class FavorGoodControl {

    @Autowired
    private FavorGoodService favorGoodService;

    @RequestMapping(value = "/favorGood.action",method = {RequestMethod.POST,RequestMethod.GET})
    public  void  favorGood(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String uid=request.getParameter("uid");
        String goodid=request.getParameter("goodid");

        int uid1=Integer.parseInt(uid);
        int goodid1=Integer.parseInt(goodid);

        PrintWriter out=response.getWriter();
        if(favorGoodService.selectIfCollection(uid1,goodid1)==null){
            if(favorGoodService.addCollectionByUidAndGoodid(uid1,goodid1)){
                out.print(1);
            }else {
                out.print(0);
            }
        }else {
            out.print(2);
        }
    }

    @RequestMapping(value = "/quxiaoFavor.action",method = {RequestMethod.POST,RequestMethod.GET})
    public void quxiaoFavor(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uid=request.getParameter("uid");
        String goodid=request.getParameter("goodid");
        int uid1=Integer.parseInt(uid);
        int goodid1=Integer.parseInt(goodid);
        PrintWriter out=response.getWriter();
        if(favorGoodService.deleteCollectionByUidAndGoodid(uid1,goodid1)){
            out.print(1);
        }else {
            out.print(0);
        }
    }

    @RequestMapping(value = "/selectMyFavor",method = {RequestMethod.POST,RequestMethod.GET})
    public  String selectMyFavor(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        ForumUser user=(ForumUser)request.getSession().getAttribute("user");
        if(user==null){
            return "/jsp/loginregister.jsp";
        }
        int uid=user.getUid();
        List<Favor> favorList=favorGoodService.findMyFavorByUid(uid);
        request.getSession().setAttribute("favorList",favorList);
        request.getRequestDispatcher("/jsp/mh-favorite.jsp").forward(request,response);
        return null;
    }



}
