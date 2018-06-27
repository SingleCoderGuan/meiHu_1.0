package meiHu.control;

import meiHu.entity.Goods;
import meiHu.service.HomepageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Controller
public class HomepageControl {
    @Autowired
    private HomepageService homepageService ;
    @RequestMapping(value = "/main.action")
    public void homePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Goods> recommend = homepageService.getRecommendList() ;
        Collections.shuffle(recommend);
        List<Goods> recommendList = new ArrayList<>();
        for(int i = 0 ; i < 3 ; i++){
            recommendList.add(recommend.get(i));
        }

        request.setAttribute("recommendList",recommendList);
        request.getRequestDispatcher("/jsp/zhuye.jsp").forward(request,response);
    }
}
