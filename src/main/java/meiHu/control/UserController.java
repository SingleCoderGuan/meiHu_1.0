package meiHu.control;

import meiHu.entity.ForumPost;
import meiHu.entity.ForumUser;
import meiHu.service.FocusService;
import meiHu.service.PostService;
import meiHu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
    @Autowired
    private FocusService focusService;
    @Autowired
    private UserService userService ;
    @Autowired
    private PostService postService ;

    @RequestMapping(value = "/loginWithAccount.action",method = RequestMethod.POST)
    public void findUserByUname(String uname,String password,String flag, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = userService.findUserByUname(uname);
        if(user!=null){
            if(user.getPassword().equals(password)){
//                登陆成功
                if("1".equals(flag)) {
                    boolean f = false ;
                    Cookie[] cookies = request.getCookies() ;
                    for(Cookie c : cookies) {
                        if("userInfo".equals(c.getName())) {
                            f = true ;
                            break ;
                        }
                    }
                    if(!f) {
                        Cookie cookie = new Cookie("userInfo", uname+"-"+password) ;
                        cookie.setMaxAge(10000);
                        cookie.setPath("/");

                        response.addCookie(cookie);
                    }
                }

                request.getSession().setAttribute("user",user);
                request.getRequestDispatcher("/luntan/luntanshouye.action?tid=1").forward(request,response);
            }else{
//                密码错误
                response.sendRedirect(request.getContextPath()+"/jsp/loginregister.jsp?rslt=1");
            }
        }else{
//            用户名不存在
            response.sendRedirect(request.getContextPath()+"/jsp/loginregister.jsp?rslt=2");
        }

    }

    @RequestMapping(value = "/register.action",method = RequestMethod.POST)
    public void register(String username ,String password ,String phone,HttpServletRequest request ,HttpServletResponse response ) throws IOException, ServletException {
        userService.insertUser(username,password,phone,new Date()) ;
        response.sendRedirect(request.getContextPath()+"/jsp/loginregister.jsp?rslt=3");
    }

    @RequestMapping(value = "/loginWithTel.action",method = RequestMethod.GET)
    public void findUser(String tel,HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {

        ForumUser user = userService.findUserByTel(tel) ;
        if(user!=null){
            request.getSession().setAttribute("user",user);
            response.getWriter().print("1");
        }else {
            response.getWriter().print("0");
        }
    }

    @RequestMapping(value = "/perferUser.action",method = RequestMethod.POST)
    public void perfectUser(ForumUser user ,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        user.setRegistertime(new Date());
        userService.insertUser(user.getUname(),user.getPassword(),user.getTel(),new Date()) ;
        ForumUser forumUser = userService.findUserByTel(user.getTel()) ;
        request.getSession().setAttribute("user",forumUser);
        request.getRequestDispatcher("/luntan/luntanshouye.action?tid=1").forward(request,response);
    }

    @RequestMapping(value = "/namecheck.action",method = RequestMethod.GET)
    public @ResponseBody String checkUname(String uname,HttpServletRequest request,HttpServletResponse response) throws IOException {
        ForumUser user = userService.findUserByUname(uname);
        System.out.println(user);
        if(user!=null){
            return "0" ;
        }else{
            return "1" ;
        }
    }

    @RequestMapping(value = "/checktel.action",method = RequestMethod.GET)
    public @ResponseBody String checkTel(String tel,HttpServletRequest request,HttpServletResponse response){
        if(userService.findUserByTel(tel)!=null){
            return "1" ;
        }else{
            return "0" ;
        }
    }

    @RequestMapping(value = "/userCenter.action")
    public void gotoUserCenter(HttpServletRequest request,HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession() ;
        ForumUser user = (ForumUser) session.getAttribute("user");
        System.out.println(user);
        int uid = user.getUid() ;
        List<ForumPost> collectionList = postService.selectCollectionByUserUid(uid) ;
        List<ForumPost> postList = postService.selectPostsByUid(uid) ;
        List<ForumUser> focusUsers = userService.findFocusUsersByUid(uid) ;
        List<ForumUser> followers = userService.findFollowersByUid(uid) ;
        session.setAttribute("userlikenum",userService.selectLikeNumByUid(uid));
        session.setAttribute("collectionList",collectionList);
        session.setAttribute("postList",postList);
        session.setAttribute("focusUsers",focusUsers);
        session.setAttribute("followers",followers);
        response.sendRedirect(request.getContextPath()+"/jsp/userPersonalCenter.jsp");
    }

    @RequestMapping(value = "/signOut.action")
    public void signOut(HttpServletRequest request,HttpServletResponse response) throws IOException {
        request.getSession().invalidate();
        response.sendRedirect(request.getContextPath()+"/jsp/loginregister.jsp");
    }

    @RequestMapping(value = "/preresetpass.action",method = RequestMethod.POST)
    public void preresetpass(String tel,HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setAttribute("tel",tel);
        request.getRequestDispatcher("/jsp/resetpass.jsp").forward(request,response);
    }

    @RequestMapping(value = "/resetpass.action",method = RequestMethod.POST)
    public void resetPass(String tel,String password,HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = userService.findUserByTel(tel);
        user.setPassword(password);
        if(userService.resetPass(user)){
            response.sendRedirect(request.getContextPath()+"/jsp/loginregister.jsp?rslt=4");
        }
    }

    @RequestMapping(value = "/modifyPost.action",method = RequestMethod.GET)
    public void modifyPost(int pid,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {

        ForumPost post = postService.selectPostByPid(pid) ;
        post.setPcontent(post.getPcontent().replace("(\r\n|\r|\n|\n\r)", ""));
        System.out.println("-----------------"+post);
        request.setAttribute("post",post);
        request.getRequestDispatcher("/jsp/modifyPost.jsp").forward(request,response);
    }

    @RequestMapping(value = "/deletePost.action",method = RequestMethod.GET)
    public @ResponseBody String deletePost(int pid,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        if(postService.deletePost(pid)){
            return "1" ;
        }else {
            return "0" ;
        }
    }

    @RequestMapping(value = "/updateUser.action",method = RequestMethod.POST)
    public void updateTrue(MultipartFile imgFileUp, ForumUser forumUser, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ForumUser newUser = forumUser ;
//        MultipartFile imgFileUp  接收文件选择器上传的文件
        //获取该文件的名字
        String filename=imgFileUp.getOriginalFilename();
        //  d://java_workplace//demo//images
        // 将这个文件上传到服务器上  （images 文件夹在服务器上绝对路径）
        String imgFile=request.getServletContext().getRealPath("images/userHeadpic");
//        d://java_workplace//demo//images//菊花.pig
        String img=imgFile+"/"+filename;
        File file=new File(img);
//        创建
        if (!file.exists()){//不存在直接创建
            file.mkdirs();
        }else{
            file.delete();//删除再创建
            file.mkdirs();
        }
        //通过IO技术将自己电脑上的文件内容一个个读取到服务器上新创建的图片上
        imgFileUp.transferTo(file);    //图片的复制
        //图片路径发生改变
        newUser.setHeadpic("images/userHeadpic/"+filename);

//                调用service层的修改方法
        if (userService.updateUser(newUser)){
            request.getSession().setAttribute("user",userService.selectUserByUid(newUser.getUid()));
            request.getRequestDispatcher("/userCenter.action") .forward(request,response);
        }else{
        }
    }



}
