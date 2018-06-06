package com.aaa.controller;

import meiHu.util.GetMessageCode;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/jsp/sendSMS")
public class SendSms extends HttpServlet {
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String phone=req.getParameter("phone");
		//根据获取到的手机号发送验证码
		String code= GetMessageCode.getCode(phone);


	}
}
