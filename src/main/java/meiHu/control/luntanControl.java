package meiHu.control;


import meiHu.entity.ForumPost;
import meiHu.entity.ForumTopic;
import meiHu.service.LuntanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "/luntan")
public class luntanControl {
    @Autowired
    private LuntanService luntanService;

    @RequestMapping(value = "/bankuai.action")
    public void showbankuai(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ForumTopic> topicList = luntanService.getAllTopics();
        request.setAttribute("topicList",topicList);

        List<ForumPost> postList = luntanService.selectPostsByTid(1);
        request.setAttribute("postList",postList);
        request.getRequestDispatcher("/jsp/luntan.jsp?topicid=1").forward(request,response);
    }


}
