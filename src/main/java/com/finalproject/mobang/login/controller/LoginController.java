package com.finalproject.mobang.login.controller;

import java.util.Locale;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.finalproject.mobang.login.biz.LoginBiz;
import com.finalproject.mobang.login.biz.LoginBizImpl;
import com.finalproject.mobang.login.dto.LoginDto;
import com.finalproject.mobang.login.email.MailHandler;
import com.finalproject.mobang.user.biz.roomsearchBiz;
import com.finalproject.mobang.user.controller.HomeController;

@Controller
public class LoginController {

private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	LoginBiz biz;

	/* Email */
	@Autowired
	MailHandler mailService = new MailHandler();
	
	@RequestMapping(value = "/login.all")
	public String home(Locale locale, Model model) {
		logger.info("login");

		return "login/login";
	}
	
	@RequestMapping(value = "/access_denied_page.all")
	public String access_denied_page(Locale locale, Model model) {
		logger.info("access_denied_page");

		return "login/access_denied_page";
	}
	
	@RequestMapping(value = "/usersignupform.all")
	public String usersignupform(Locale locale, Model model) {
		logger.info("usersignupform");
		

		return "login/user_signup";
	}
	
	@RequestMapping(value = "/usersignup.all")
	public String usersignup(Model model, LoginDto dto) {
		logger.info("usersignup");
		int res = biz.userInsert(dto);
		
		if(res > 0) {
			return "login/login";
		} else {
			return "login/user_signup";
		}
	}
	
	@RequestMapping(value="/email")
	public class emailController {
	
		@RequestMapping(value="/email.do")
		public ModelAndView board2(){
			ModelAndView mv = new ModelAndView();
			int ran = new Random().nextInt(900000) + 100000;
			mv.setViewName("test/email");
			mv.addObject("random", ran);
			return mv;
		}
	}
	
	@RequestMapping(value="/createEmailCheck.all")
		@ResponseBody
		public boolean createEmailCheck(@RequestParam String email, @RequestParam int random, HttpServletRequest req){
			//이메일 인증
			int ran = new Random().nextInt(900000) + 100000;
			
			
			HttpSession session = req.getSession(true);
			String authCode = String.valueOf(ran);
			
			session.setAttribute("authCode", authCode);
			session.setAttribute("random", random);
			
			String subject = "회원가입 인증 코드 발급 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			
			sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
			
			return mailService.send(subject, sb.toString(), "hyerin03158@gmail.com", email);
	}

	@RequestMapping(value="/emailAuth.all")
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random, HttpSession session){
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		
		if(originalJoinCode.equals(authCode) && originalRandom.equals(random)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		}
		else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}
	
	@RequestMapping(value = "/google.all")
	public String google(Locale locale, Model model) {
		logger.info("google login");

		String email = (String) model.getAttribute("email");
		System.out.println(email);
		
		return "login/user_signup";
	}

}
