package meiHu.control;


import com.github.pagehelper.PageInfo;
import meiHu.entity.ForumPost;
import meiHu.entity.ForumTopic;
import meiHu.service.GoodService;
import meiHu.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/search")
public class SearchControl {
    @Autowired
    private GoodService goodService;
    @Autowired
    private PostService postService;

    @RequestMapping("/automatch.action")// produces = "application/json; charset=utf-8"
    public void automatch(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=utf-8"); //当然如果是json数据,需要设置为("text/javascript;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String name = request.getParameter("name");
        List<ForumPost> postList = postService.selectPostsByPtitle(name);
        String res = "";
        int i = 0;
        for (ForumPost forumPost : postList) {
            if (i > 0) {
                res += "," + forumPost.getPtitle();
            } else {
                res += forumPost.getPtitle();
            }
            i++;

        }
        response.getWriter().write(res);
    }


    @RequestMapping("/searchReasult.action")
    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String searchcontent = request.getParameter("searchcontent");
        List<ForumPost> postList=postService.selectPostsByPtitle(searchcontent);
        request.setAttribute("postList",postList);
        request.setAttribute("search",searchcontent);
        request.getRequestDispatcher("/jsp/searchresult.jsp").forward(request,response);
    }

    @RequestMapping(value = "/goodsPosts.action" )
    public void searchByGoodsName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int goodid = Integer.parseInt(request.getParameter("goodid")) ;
        String goodsName = goodService.getGood(goodid).getGoodname() ;
        List<ForumPost> postList=postService.selectPostsByPtitle(goodsName);
        request.setAttribute("postList",postList);
        request.getRequestDispatcher("/jsp/searchresult.jsp").forward(request,response);
    }
}
