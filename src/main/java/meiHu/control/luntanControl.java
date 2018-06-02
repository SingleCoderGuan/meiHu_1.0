package meiHu.control;


import meiHu.entity.ForumPost;
import meiHu.entity.ForumTopic;
import meiHu.service.LuntanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "/luntan")
public class luntanControl {
    @Autowired
    private LuntanService luntanService;

    @RequestMapping(value = "/luntanshouye.action")
    public void luntanshouye(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String tid = request.getParameter("tid");
        int tid1 = Integer.parseInt(tid);
        List<ForumTopic> topicList=luntanService.getAllTopics();
        List<ForumPost> postList=luntanService.selectPostsByTid(tid1);
        request.setAttribute("topicList",topicList);
        request.setAttribute("postList",postList);
        request.setAttribute("tid1",tid1);
        request.getRequestDispatcher("/jsp/luntan.jsp").forward(request,response);


    }


    @RequestMapping(value = "/tiezidetail.action",method = RequestMethod.GET)
    public void tiezidetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        //System.out.println(pid);
        int pid1 = Integer.parseInt(pid);
        ForumPost forumPost = luntanService.selectPostByPid(pid1);
        request.setAttribute("forumPost",forumPost);
       // System.out.println(forumPost.getPtitle());
        request.getRequestDispatcher("/jsp/tiezidetail.jsp").forward(request,response);
    }




   @RequestMapping("/tiaojian.action")
   public void tiaojian(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String tiaojian = request.getParameter("tiaojian");
       System.out.println(tiaojian);
       String tid = request.getParameter("tid");
       System.out.println(tid);
       int tid1 = Integer.parseInt(tid);
        if("tuijian".equals(tiaojian)){
            List<ForumTopic> topicList= luntanService.getAllTopics();
            List<ForumPost> postList= luntanService.selectAllPostsOrderByVisits(tid1);
           request.setAttribute("topicList",topicList);
           request.setAttribute("postList",postList);
            request.setAttribute("tid1",tid1);
           request.getRequestDispatcher("/jsp/luntan.jsp").forward(request,response);
       }else if("zuixin".equals(tiaojian)){

            List<ForumTopic> topicList= luntanService.getAllTopics();
            List<ForumPost> postList= luntanService.selectAllPostsOrderByCreatetime(tid1);
           request.setAttribute("topicList",topicList);
           request.setAttribute("postList",postList);
            request.setAttribute("tid1",tid1);
           request.getRequestDispatcher("/jsp/luntan.jsp").forward(request,response);
       }
   }


}
