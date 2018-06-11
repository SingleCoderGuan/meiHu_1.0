package meiHu.control;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/admin")
public class AdminControl {

    @RequestMapping("/adminlogin.action")
    public void admin(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        if("admin".equals(request.getParameter("uname"))&&"admin".equals(request
        .getParameter("upass"))){
            request.getRequestDispatcher("/admin/adminindex.jsp").forward(request,response);
        }
    }
}
