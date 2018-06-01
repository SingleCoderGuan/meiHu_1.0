package meiHu.control;

import meiHu.entity.ForumUser;
import meiHu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class UserController {
    @Autowired
    private UserService userService ;

    @RequestMapping(value = "/loginWithAccount.action",method = RequestMethod.POST)
    public void findUserByUname(String uname,String password, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        ForumUser user = userService.findUserByUname(uname);
        if(user!=null){
            if(user.getPassword().equals(password)){
//                登陆成功
                request.setAttribute("user",user);
                request.getRequestDispatcher("/jsp/login&register.jsp?rslt=0").forward(request,response);
            }else{
//                密码错误
                response.sendRedirect(request.getContextPath()+"/jsp/login&register.jsp?rslt=2");
            }
        }else{
//            用户名不存在
            response.sendRedirect(request.getContextPath()+"/jsp/login&register.jsp?rslt=1");
        }

    }
    @RequestMapping("/register.action")
    public String register(String id ,String password ,String tel,HttpServletRequest request ,HttpServletResponse response ){
        if(id.equals("3")){
            return "账号注册成功";
        }else{
            return "账号注册失败" ;
        }
    }

    public ForumUser findUser(String uname,HttpServletRequest request,HttpServletResponse response){
        return userService.findUserByUname(uname) ;
    }
}
