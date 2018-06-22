package meiHu.control;

import meiHu.entity.ForumPost;
import meiHu.entity.ForumTopic;
import meiHu.entity.ForumUser;
import meiHu.service.ArticleService;
import meiHu.service.PostService;
import meiHu.service.TopicService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

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
    TopicService topicService ;
    @Autowired
    PostService postService;
    @RequestMapping(value = "/fatie.action")
    public void fatie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getSession().getAttribute("user")==null){
            response.sendRedirect(request.getContextPath()+"/jsp/loginregister.jsp");
        }else {
            response.sendRedirect(request.getContextPath()+"/jsp/fatie.jsp");
        }
    }

    @RequestMapping(value = "/newpost.action", method = RequestMethod.POST)
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
    @RequestMapping(value = "updatePost.action",method = RequestMethod.POST)
    public void updatePost(ForumPost post, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ForumPost forumPost = post ;
        forumPost.setUser((ForumUser) request.getSession().getAttribute("user"));
        forumPost.setCreatetime(new Date());
        if(postService.updatePost(forumPost) ){
            response.sendRedirect(request.getContextPath() + "/userCenter.action");
        }
    }

    @RequestMapping(value = "/picload.action",method = RequestMethod.POST)
    public @ResponseBody Map<String, String> upload(MultipartFile uploadImage, HttpServletRequest request) throws IOException {
        //原始文件名称
        String pictureFile_name =  uploadImage.getOriginalFilename();
        //新文件名称
        String newFileName = UUID.randomUUID().toString()+pictureFile_name.substring(pictureFile_name.lastIndexOf("."));

        //获得图片上传的路径
        String path=request.getServletContext().getRealPath("image/upload");

        //上传图片
        File uploadPic = new File(path+"/"+newFileName);

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
}
