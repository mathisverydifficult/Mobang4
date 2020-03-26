package com.finalproject.mobang.user.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.mobang.user.biz.reviewBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private reviewBiz biz;

	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
		logger.info("home");

		
		return "user/user_home";
	}
	
	
	@RequestMapping(value = "home.user")
	public String mainhome(Locale locale, Model model) {
		logger.info("home");

		
		return "user/user_home";
	}
	
	
	@RequestMapping(value="index.all")
	public String index() {
		return "index";
	}

	@RequestMapping(value="/roommate_recommand.user")
	public String roommaterecommand(Model model) {
		
		return "/user/roommate_recommand";
	}
	
	@RequestMapping(value="/favorite_recent.user")
	public String favoriterencent(Model model) {
		
		return "user/favorite_recent";
	}
	@RequestMapping(value="/favorite_dibs.user")
	public String favoritedibs(Model model) {
		
		return "/user/favorite_dibs";
	}
	
	@RequestMapping(value="/room_search.user")
	public String roomsearch(Model model) {
		
		return "user/room_search";
	}
	
	@RequestMapping(value="/review.user")
	public String review(Model model) {
		
		
		logger.info("select list");
		
		model.addAttribute("list", biz.selectList());
		
		return "user/user_review";
	}
	
}
