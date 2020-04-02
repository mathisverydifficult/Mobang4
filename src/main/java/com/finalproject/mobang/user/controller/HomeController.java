package com.finalproject.mobang.user.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.finalproject.mobang.user.biz.roomsearchBiz;
import com.finalproject.mobang.user.dto.roomsearchDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private roomsearchBiz roombiz;
	

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
	
	@RequestMapping(value="/homesearch.user")
	public String homesearch(Model model, String keyword) {
		//String keyword = (String) model.getAttribute("keyword");
		
		model.addAttribute("keyword", keyword);
		
		return "user/room_search";
	}
	
	
	@RequestMapping(value="/index.all")
	public String index() {
		return "index";
	}

	
	
	@ResponseBody		//데이터 조회시 붙이는 annotation
	@RequestMapping(value="/room_search.user")
	public List<roomsearchDto> roomsearch(Model model, String keyword) {	//viewResolver가 리턴타입이 String일때만 return값의 jsp를 찾아서 리턴.
		
		List<roomsearchDto> test = roombiz.selectsearchList(keyword);
		
		return test;
	}
	
	
	
}
