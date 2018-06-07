package meiHu.control;

import meiHu.entity.ForumPost;
import meiHu.entity.ForumUser;
import meiHu.service.PostService;
import meiHu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

@Controller
public class UserController {
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
    public void register(String username ,String userpassword ,String phone,HttpServletRequest request ,HttpServletResponse response ) throws UnsupportedEncodingException {
        userService.insertUser(username,userpassword,phone,new Date()) ;
        request.getRequestDispatcher(request.getContextPath()+"/jsp/loginregister.jsp") ;
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

    @RequestMapping(value = "/sendCodes.action",method = RequestMethod.GET)
    public void RestCodesJudge(String trueCode, String userCode, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        System.out.println(trueCode+"-------------"+userCode);
        response.setContentType("text/text");
        response.setCharacterEncoding("UTF-8");
        if(trueCode.equals(userCode)){
            System.out.println("验证码对了，但是没跳转");
            response.getWriter().print(request.getContextPath()+"/jsp/resetpass.jsp");
        }else{
            response.getWriter().print("wrong");
        }
    }
}
