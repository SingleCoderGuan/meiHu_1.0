package meiHu.control;

import meiHu.dao.ForumPostMapper;
import meiHu.dao.ForumTopicMapper;
import meiHu.entity.ForumPost;
import meiHu.entity.ForumTopic;
//import net.sf.json.JSONObject;
import meiHu.entity.ForumUser;
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
    ForumTopicMapper forumTopicMapper ;
    @Autowired
    ForumPostMapper forumPostMapper ;
    @RequestMapping(value = "/fatie.action")
    public void fatie(HttpServletRequest request, HttpServletResponse response) throws IOException {
        if(request.getSession().getAttribute("user")==null){
            response.sendRedirect(request.getContextPath()+"/jsp/loginregister.jsp");
        }else {
            response.sendRedirect(request.getContextPath()+"/jsp/fatie.jsp");
        }
    }
    @RequestMapping(value = "/newpost.action")
    public void newPost(ForumPost post , int topicid, HttpServletRequest request, HttpServletResponse response) throws IOException {
        ForumTopic topic = forumTopicMapper.selectTopicByTid(topicid);
        ForumPost forumPost = post ;
        forumPost.setUser((ForumUser) request.getSession().getAttribute("user"));
        forumPost.setCreatetime(new Date());
        forumPost.setTopic(topic);
        if(forumPostMapper.insert(forumPost)){
            response.sendRedirect(request.getContextPath()+"/luntan/luntanshouye.action");
        }else{
            System.out.println("发帖失败");
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
        File uploadPic = new java.io.File(path+"/"+newFileName);

        if(!uploadPic.exists()){
            uploadPic.mkdirs();
        }
        //向磁盘写文件
        uploadImage.transferTo(uploadPic);
        System.out.println(request.getServletContext().getContextPath()+"image/upload"+"/"+newFileName);
        Map<String,String> map=new HashMap();
//        map.put("url",request.getContextPath()+"/image/upload"+"/"+newFileName);
//        JSONObject jsonObject = JSONObject.fromObject(map);
//        return jsonObject.toString();
        map.put("url",request.getContextPath()+"/image/upload"+"/"+newFileName);
        return map;

    }
}
