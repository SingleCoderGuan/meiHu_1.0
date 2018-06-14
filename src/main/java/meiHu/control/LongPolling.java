package meiHu.control;

import meiHu.entity.ForumComment;
import meiHu.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequestMapping("/user")
@Controller
public class LongPolling {
    @Autowired
    private MessageService messageService ;
    @RequestMapping(value = "/getMessage.action")
    public void findMessage(String uid, HttpServletRequest request, HttpServletResponse response) throws IOException, InterruptedException {
        List<ForumComment> forumComments = messageService.getMessage(Integer.parseInt(uid)) ;
        while (forumComments.size()==0){
            response.getWriter().print("0");
            return;
        }
        response.getWriter().print(forumComments.size());
    }
}
