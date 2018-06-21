package meiHu.control;

import com.github.pagehelper.PageInfo;
import meiHu.entity.ForumCommentreport;
import meiHu.entity.ForumPostreport;
import meiHu.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminControl {
    @Autowired
    private AdminService adminService;

    @RequestMapping("/adminlogin.action")
    public void admin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if ("admin".equals(request.getParameter("uname")) && "admin".equals(request
                .getParameter("upass"))) {
//            request.getSession().setAttribute("admin","admin");
            request.getRequestDispatcher("/admin/adminindex.jsp").forward(request, response);
        }else{
            request.setAttribute("info",1);
            request.getRequestDispatcher("/admin/adminlogin.jsp").forward(request, response);

        }
    }

    @RequestMapping("/showallpostreport.action")
    public void postreport(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String ,Object> cmap=new HashMap<>();
        //每页显示的条数
        int pageSize=7;
        //当前的页面默认是首页
        int curPage=1;
        String scurPage=request.getParameter("curPage");
        if (scurPage!=null&&!scurPage.trim().equals("")){

            curPage=Integer.parseInt(scurPage);
        }
        cmap.put("curPage",curPage);
        cmap.put("pageSize",pageSize);
        PageInfo<ForumPostreport> pageInfo = adminService.selectAllForumPostreport(cmap);
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("value", 1);
        request.getRequestDispatcher("/admin/jubaoxinxi.jsp").forward(request, response);
    }

    @RequestMapping("/deletepost.action")
    public void delete(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int pid = Integer.parseInt(request.getParameter("pid"));
        adminService.deletePostByPid(pid);
        PrintWriter out = response.getWriter();
        out.print(1);
    }

    @RequestMapping("/chaxun.action")
    public void chaxun(String isshow,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int a = Integer.parseInt(isshow);
        if(a==1){

            response.sendRedirect( request.getContextPath()+"/admin/showallpostreport.action");
        }
        else if(a==2){
            Map<String ,Object> cmap=new HashMap<>();
            //每页显示的条数
            int pageSize=7;
            //当前的页面默认是首页
            int curPage=1;
            String scurPage=request.getParameter("curPage");
            if (scurPage!=null&&!scurPage.trim().equals("")){

                curPage=Integer.parseInt(scurPage);
            }
            cmap.put("curPage",curPage);
            cmap.put("pageSize",pageSize);
            PageInfo<ForumCommentreport> pageInfo1 = adminService.selectAllForumCommentreport(cmap);
            request.setAttribute("pageInfo1", pageInfo1);
            request.setAttribute("value1", 2);
            request.getRequestDispatcher("/admin/jubaoxinxi.jsp").forward(request, response);
        }
    }
    @RequestMapping("/deletecomment.action")
   public void dc(HttpServletRequest request,HttpServletResponse response) throws IOException {

        int cid = Integer.parseInt(request.getParameter("cid"));
       adminService.deleteCommentByCid(cid);
       PrintWriter out = response.getWriter();
       out.print(1);
   }

}
