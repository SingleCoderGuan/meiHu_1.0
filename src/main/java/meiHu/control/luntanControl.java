package meiHu.control;


import meiHu.entity.*;
import meiHu.service.LuntanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.SocketUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
        request.getSession().setAttribute("uid",102);
        request.getRequestDispatcher("/jsp/luntan.jsp").forward(request,response);


    }


    @RequestMapping(value = "/tiezidetail.action",method = RequestMethod.GET)
    public void tiezidetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pid = request.getParameter("pid");
        int pid1 = Integer.parseInt(pid);
        int collection = luntanService.selectCollectedCountByPid(pid1);
        request.setAttribute("collectionnum",collection);
        ForumPost forumPost = luntanService.selectPostByPid(pid1);
        request.setAttribute("forumPost",forumPost);
        int postCommentNum = luntanService.selectPostCommentNum(pid1);
        request.setAttribute("postCommentNum",postCommentNum);
        List<ForumComment> forumCommentList = luntanService.selectAllPostCommentByPid(pid1);
        request.setAttribute("forumCommentList",forumCommentList);
        //根据pid查找出所有评论帖子的评论标号
        int[] cidshuzu = luntanService.selectAllCidByPid(pid1);
        Map<String,List<ForumComment>> map = new HashMap<>();
        for(int i =0;i<cidshuzu.length;i++){
            List<ForumComment> commentforcommentList = luntanService.selectAllCommentForComment(cidshuzu[i]);
            map.put(cidshuzu[i]+"",commentforcommentList);
        }
        Map<String,String> mapnum = new HashMap<>();
        for(int i =0;i<cidshuzu.length;i++){
            int num = luntanService.selectCommentCommentNum(cidshuzu[i]);
            mapnum.put(cidshuzu[i]+"",num+"");
        }
        //Set<String> set=map.keySet();
       /* for(String key:set){
            List<ForumComment> value=map.get(key);
            System.out.println(key+"___"+value);
        }*/
        request.setAttribute("map",map);
        request.setAttribute("mapnum",mapnum);
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

   @RequestMapping("/shoucang.action")
   public  void shoucang(HttpServletRequest request,HttpServletResponse response) throws IOException {
       String uid =request.getParameter("uid");
       String pid =request.getParameter("pid");

       int uidd = Integer.parseInt(uid);
       int pidd = Integer.parseInt(pid);
       luntanService.updatePostVisitNum(pidd);
       //System.out.println(luntanService.addCollectionByUidAndPid(uidd,pidd));
       PrintWriter out = response.getWriter();
       if(luntanService.addCollectionByUidAndPid(uidd,pidd)){
           out.print(1);
       }else {
           out.print(0);

       }
   }
    @RequestMapping("/quxiaoshoucang.action")
    public  void quxiaoshoucang(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uid =request.getParameter("uid");
        String pid =request.getParameter("pid");
        int uidd = Integer.parseInt(uid);
        int pidd = Integer.parseInt(pid);
        luntanService.updatePostVisitNumSub(pidd);
        PrintWriter out = response.getWriter();
        if(luntanService.deleteCollectionByUidAndPid(uidd,pidd)){
            out.print(1);
        }else {
            out.print(0);

        }
    }

   @RequestMapping("/dianzan.action")
   public  void dianzan(HttpServletRequest request,HttpServletResponse response) throws IOException {
       String uid =request.getParameter("uid");
       String pid =request.getParameter("pid");
       int uidd = Integer.parseInt(uid);
       int pidd = Integer.parseInt(pid);
       luntanService.updatePostLikeNumByPid(pidd);
       PrintWriter out = response.getWriter();
       if(luntanService.addLikeByUidAndPid(uidd,pidd)){
           out.print(1);
       }else{
           out.print(0);

       }
   }
    @RequestMapping("/quxiaodianzan.action")
    public  void quxiaodianzan(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uid =request.getParameter("uid");
        String pid =request.getParameter("pid");

        int uidd = Integer.parseInt(uid);
        int pidd = Integer.parseInt(pid);
        luntanService.updatePostLikeNumByPidSub(pidd);
        PrintWriter out = response.getWriter();
        if(luntanService.deleteLikeByUidAndPid(uidd,pidd)){
            out.print(1);
        }else{
            out.print(0);

        }
    }


    @RequestMapping("/postreport.action")
    public void postreport(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uid =request.getParameter("uid");
        String pid =request.getParameter("pid");
        String reportreason = request.getParameter("reportreason");
        int uidd = Integer.parseInt(uid);
        int pidd = Integer.parseInt(pid);
        ForumPostreport forumPostreport = new ForumPostreport(uidd,pidd,reportreason);
        PrintWriter out = response.getWriter();
        if(luntanService.addPostReport(forumPostreport)){
            out.print(1);
        }else{
            out.print(0);

        }

    }

    @RequestMapping("/postcomment.action")
    public void postcomment(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uid =request.getParameter("uid");
        String pid =request.getParameter("pid");
        int uidd = Integer.parseInt(uid);
        int pidd = Integer.parseInt(pid);
        String postcomment = request.getParameter("postcomment");
        ForumComment forumComment = new ForumComment(uidd,pidd,postcomment);
        PrintWriter out = response.getWriter();
        if(luntanService.addForumComment(forumComment)){
            out.print(1);
        }else{
            out.print(0);

        }
    }

    @RequestMapping("/commentreport.action")
    public void commentjubao(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uid =request.getParameter("uid");
        String cid =request.getParameter("cid");
        int uidd = Integer.parseInt(uid);
        int cidd = Integer.parseInt(cid);
        String reason = request.getParameter("reason");
        ForumCommentreport forumCommentreport = new ForumCommentreport(uidd,cidd,reason);
        PrintWriter out = response.getWriter();

        if(luntanService.addCommentReport(forumCommentreport)){
            out.print(1);
        }else{
            out.print(0);

        }
    }
    @RequestMapping("/commentcomment.action")
    public void commentcomment(HttpServletRequest request,HttpServletResponse response) throws IOException {
        String uid =request.getParameter("uid");
        String pid =request.getParameter("pid");
        String ccid =request.getParameter("ciddd");
        int uidd = Integer.parseInt(uid);
        int pidd = Integer.parseInt(pid);
        int ccidd = Integer.parseInt(ccid);
        String commentcomment = request.getParameter("commentcomment");
        ForumComment forumComment = new ForumComment(uidd,pidd,ccidd,commentcomment);
        PrintWriter out = response.getWriter();

       if(luntanService.addCommentForComment(forumComment)){
            out.print(1);
        }else{
            out.print(0);

        }
    }




}
