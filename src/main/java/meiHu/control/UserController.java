package meiHu.control;

import meiHu.entity.ForumPost;
import meiHu.entity.ForumUser;
import meiHu.service.PostService;
import meiHu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;

@RestController
public class UserController {
    @Autowired
    private UserService userService ;
    @Autowired
    private PostService postService ;

    @RequestMapping(value = "/loginWithAccount.action",method = RequestMethod.POST)
    public void findUserByUname(String uname,String password, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = userService.findUserByUname(uname);
        if(user!=null){
            if(user.getPassword().equals(password)){
//                登陆成功
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
    public String register(String id ,String password ,String tel,HttpServletRequest request ,HttpServletResponse response ){
        if(id.equals("3")){
            return "账号注册成功";
        }else{
            return "账号注册失败" ;
        }
    }
    @RequestMapping(value = "/loginWithTel.action",method = RequestMethod.GET)
    public void findUser(String tel,String vcode,HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        PrintWriter out = response.getWriter() ;
        //验证短信验证码
//        boolean f = true ;
       /* //验证码正确
        if (f){
            ForumUser user = userService.findUserByTel(tel) ;
            if (user!=null){
                request.setAttribute("user",user);
                request.getRequestDispatcher("#").forward(request,response);
            }else{
                //该用户是新用户，ajax刷新完善信息
                out.print("1");
            }
        }else {
            out.print("0");
        }*/
        out.print("1");
    }

    @RequestMapping(value = "/namecheck.action",method = RequestMethod.GET)
    public String checkUname(String uname,HttpServletRequest request,HttpServletResponse response) throws IOException {
        ForumUser user = userService.findUserByUname(uname);
        System.out.println(user);
        if(user!=null){
            return "0" ;
        }else{
            return "1" ;
        }
    }
    @RequestMapping(value = "/checktel.action",method = RequestMethod.GET)
    public String checkTel(String tel,HttpServletRequest request,HttpServletResponse response){
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
        int  uid = user.getUid() ;
        List<ForumPost> collectionList = postService.selectCollectionByUserUid(uid) ;
        List<ForumPost> postList = postService.selectPostsByUid(uid) ;
        List<ForumUser> focusUsers = userService.findFocusUsersByUid(uid) ;
        List<ForumUser> followers = userService.findFollowersByUid(uid) ;
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
}
