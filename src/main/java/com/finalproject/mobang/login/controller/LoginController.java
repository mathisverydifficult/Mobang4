package com.finalproject.mobang.login.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.mobang.user.biz.roomsearchBiz;
import com.finalproject.mobang.user.controller.HomeController;

@Controller
public class LoginController {

private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/login.all")
	public String home(Locale locale, Model model) {
		logger.info("login");

		return "login/login";
	}
	
	@RequestMapping(value = "/access_denied_page.all")
	public String access_denied_page(Locale locale, Model model) {
		logger.info("login");

		return "login/access_denied_page";
	}
}
