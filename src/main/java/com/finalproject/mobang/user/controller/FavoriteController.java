package com.finalproject.mobang.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.mobang.user.biz.FavoriteBiz;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FavoriteController {
	
	private static final Logger logger = LoggerFactory.getLogger(FavoriteController.class);
	
	@Autowired
	private FavoriteBiz biz;
	
	@RequestMapping(value="/favorite_recent.user")
	public String UserRecent(Model model) {
		logger.info("사용자가 최근에 본 방");
		
		String email = "michaelhj@naver.com";
		
		model.addAttribute("list", biz.selectListRecent(email));
		
		model.addAttribute("count",biz.recentCount(email));
		
		return "user/favorite_recent";
		
	}
	
	@RequestMapping(value="/favorite_dibs.user")
	public String UserDibs(Model model) {
		logger.info("사용자가 최근에 찜한 방");
		
		String email = "michaelhj@naver.com";
		
		model.addAttribute("list", biz.selectListDibs(email));
		
		model.addAttribute("count",biz.dibsCount(email));
		
		return "user/favorite_dibs";
	}
	
}
