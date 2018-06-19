package meiHu.control;

import meiHu.entity.ForumOfficalarticle;
import meiHu.entity.ForumPost;
import meiHu.entity.ForumTopic;
import meiHu.entity.ForumUser;
import meiHu.service.ArticleService;
import meiHu.service.OfficalArticleService;
import meiHu.service.PostService;
import meiHu.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
public class fatieControl {
    @Autowired
    private ArticleService articleService;
    @Autowired
    private TopicService topicService ;
    @Autowired
    private PostService postService;
    @Autowired
    private OfficalArticleService officalArticleService ;

    @RequestMapping(value = "/user/fatie.action")
    public void fatie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getSession().getAttribute("user")==null){
            response.sendRedirect(request.getContextPath()+"/jsp/loginregister.jsp");
        }else {
            response.sendRedirect(request.getContextPath()+"/jsp/fatie.jsp");
        }
    }

    @RequestMapping(value = "/user/newpost.action", method = RequestMethod.POST)
    public void newPost(int topicid, ForumPost post, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ForumTopic topic = topicService.selectTopicByTid(topicid);
        ForumPost forumPost = post;
        forumPost.setPcontent(forumPost.getPcontent().replaceAll("(\r\n|\r|\n|\n\r)", "<br>"));
        forumPost.setUser((ForumUser) request.getSession().getAttribute("user"));
        forumPost.setCreatetime(new Date());
        forumPost.setTopic(topic);
        if (postService.postNewPost(forumPost)) {
            articleService.fatiezijiawufen(post.getUser().getUid());
            response.sendRedirect(request.getContextPath() + "/luntan/luntanshouye.action?tid=1");
        } else {
            System.out.println("发帖失败");
        }
    }

    @RequestMapping(value = "/admin/newoa.action",method = RequestMethod.POST)
    public void newOa(ForumOfficalarticle forumOfficalarticle,HttpServletRequest request, HttpServletResponse response){
        if(officalArticleService.insertArticle(forumOfficalarticle)){
            System.out.println("插入成功");
        }
    }

    @RequestMapping(value = "/user/updatePost.action",method = RequestMethod.POST)
    public void updatePost(ForumPost post, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ForumPost forumPost = post ;
        forumPost.setUser((ForumUser) request.getSession().getAttribute("user"));
        forumPost.setCreatetime(new Date());
        if(postService.updatePost(forumPost) ){
            response.sendRedirect(request.getContextPath() + "/user/userCenter.action");
        }
    }

    @RequestMapping(value = "/user/picload.action",method = RequestMethod.POST)
    public @ResponseBody Map<String, String> upload(MultipartFile uploadImage, HttpServletRequest request) throws IOException {
        //原始文件名称
        String pictureFile_name =  uploadImage.getOriginalFilename();
        //新文件名称
        String newFileName = UUID.randomUUID().toString()+pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

        //获得图片上传的路径
        String path=request.getServletContext().getRealPath("image/upload");

        //上传图片
        File uploadPic = new java.io.File(path+"/"+newFileName);

        if(!uploadPic.exists()){
            uploadPic.mkdirs();
        }
        //向磁盘写文件
        uploadImage.transferTo(uploadPic);
        System.out.println(request.getServletContext().getContextPath()+"image/upload"+"/"+newFileName);
        Map<String,String> map=new HashMap();
        map.put("url",request.getContextPath()+"/image/upload"+"/"+newFileName);
        return map;

    }

    @RequestMapping(value = "/oapicload.action",method = RequestMethod.POST)
    public @ResponseBody Map<String, String> oaupload(MultipartFile oauploadImage, HttpServletRequest request) throws IOException {
        //原始文件名称
        String pictureFile_name =  oauploadImage.getOriginalFilename();
        //新文件名称
        String newFileName = UUID.randomUUID().toString()+pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

        //获得图片上传的路径
        String path=request.getServletContext().getRealPath("image/oaupload");

        //上传图片
        File uploadPic = new java.io.File(path+"/"+newFileName);

        if(!uploadPic.exists()){
            uploadPic.mkdirs();
        }
        //向磁盘写文件
        oauploadImage.transferTo(uploadPic);
        System.out.println(request.getServletContext().getContextPath()+"image/oaupload"+"/"+newFileName);
        Map<String,String> map=new HashMap();
        map.put("url",request.getContextPath()+"/image/oaupload"+"/"+newFileName);
        return map;

    }

    @RequestMapping(value = "/admin/articleList.action")
    public void articleList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("articleList",articleService.getAllOfficalArticles());
        request.getRequestDispatcher("/jsp/wenzhangxiangqing.jsp").forward(request,response);
    }

    @RequestMapping(value = "/admin/getArticle.action",method = RequestMethod.POST)
    public @ResponseBody ForumOfficalarticle findArticleByOaid(String oaid,HttpServletRequest request, HttpServletResponse response){
        Integer id = Integer.parseInt(oaid) ;
        return articleService.selectOfficalArticleByOaid(id);
    }
    @RequestMapping(value = "/admin/deleteArticle.action",method = RequestMethod.POST)
    public @ResponseBody String deleteArticle(String oaid,HttpServletRequest request, HttpServletResponse response){
        if(officalArticleService.deleteArticle(Integer.parseInt(oaid))){
            return "1" ;
        }else {
            return "0" ;
        }

    }
}
