package meiHu.control;


import com.github.pagehelper.PageInfo;
import meiHu.entity.ForumOfficalarticle;
import meiHu.entity.ForumSign;
import meiHu.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/article")
public class ArticleControl {
    @Autowired
    private ArticleService articleService;

    @RequestMapping("/sign.action")
    public void sign(HttpServletRequest request, HttpServletResponse response) throws IOException, ParseException {
        String uid = request.getParameter("uid");
        boolean flag = false;
        int uidd = Integer.parseInt(uid);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if(articleService.queryIfExistUid(uidd)==null){
            flag = articleService.addSignForNewUser(uidd);
        }else {
            Date currenttime = articleService.queryIfExistUid(uidd);
            Date todaytime = new Date();
            String ctime = sdf.format(currenttime);
            String ttime = sdf.format(todaytime);
            if( (sdf.parse(ttime).getTime() - sdf.parse(ctime).getTime())< 24*60*60*1000){
                flag = false;
            }else {
                flag = articleService.addSignForUser(uidd);
                articleService.fapinglunjialiangfen(uidd);
            }
        }
        PrintWriter out =  response.getWriter();
        if(flag==true){
            out.print(1);
        }else{
            out.print(0);
        }
    }
    @RequestMapping("/article.action")
    public void showallarticle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String ,Object> cmap=new HashMap<>();
        //每页显示的条数
        int pageSize=5;
        //当前的页面默认是首页
        int curPage=1;
        String scurPage=request.getParameter("curPage");
        if (scurPage!=null&&!scurPage.trim().equals("")){

            curPage=Integer.parseInt(scurPage);
        }
        cmap.put("curPage",curPage);
        cmap.put("pageSize",pageSize);
        PageInfo<ForumOfficalarticle> pageInfo = articleService.selectAllArticle(cmap);
        request.setAttribute("pageInfo",pageInfo);
        request.getRequestDispatcher("/jsp/article.jsp").forward(request,response);
    }

    @RequestMapping("/articledetail.action")
    public void articledetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String oaid = request.getParameter("oaid");
        int oid = Integer.parseInt(oaid);
        ForumOfficalarticle forumOfficalarticle = articleService.selectOfficalArticleByOaid(oid);
        request.setAttribute("forumOfficalarticle",forumOfficalarticle);
        request.getRequestDispatcher("/jsp/articledetail.jsp").forward(request,response);

    }
}
