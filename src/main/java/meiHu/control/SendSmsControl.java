package meiHu.control;

import meiHu.service.UserService;
import meiHu.util.GetMessageCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class SendSmsControl {
	@Autowired
	private UserService userService;

	@RequestMapping(value = "resetSend.action",method = RequestMethod.GET)
	public void resetSend(String tel,HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		System.out.println("daodaduanxin");
		System.out.println(tel);
		//根据获取到的手机号发送验证码
		String code = GetMessageCode.getCode(tel);
		System.out.println(code);
		response.getWriter().print(code);

	}
}
