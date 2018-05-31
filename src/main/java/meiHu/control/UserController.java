package meiHu.control;

import meiHu.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class UserController {
    @Autowired
    private UserService userService ;
    @RequestMapping("/loginWithAccount.action")
    public void findUserByUname(String uname, HttpServletRequest request,HttpServletResponse response){
        if(userService.findUserByUname(uname)!=null){

        }else{

        }

    }
}
