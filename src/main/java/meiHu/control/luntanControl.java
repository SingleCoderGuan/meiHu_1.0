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
        if(tid1==1){
            List<ForumTopic> topicList = luntanService.getAllTopics();
            List<ForumPost> postList = luntanService.selectPostsByTid(1);
            request.setAttribute("topicList",topicList);
            request.setAttribute("postList",postList);
//        System.out.println("postd长度"+postList.size());
            request.getRequestDispatcher("/jsp/luntan.jsp").forward(request,response);
        }
        else{
            List<ForumPost> postList = luntanService.selectPostsByTid(tid1);
            List<ForumTopic> topicList = luntanService.getAllTopics();
            request.setAttribute("topicList",topicList);
            request.setAttribute("postList",postList);
            request.getRequestDispatcher("/jsp/luntan.jsp").forward(request,response);

        }




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


   /* @RequestMapping(value = "/bankuai.action")
    public void bankuai(HttpServletRequest request, HttpServletResponse response){
        String tid = request.getParameter("tid");
        int tid1 = Integer.parseInt(tid);

    }*/


}
