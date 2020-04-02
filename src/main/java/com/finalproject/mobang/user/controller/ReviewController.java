package com.finalproject.mobang.user.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.mobang.user.biz.ReviewBiz;
import com.finalproject.mobang.user.dto.Criteria;
import com.finalproject.mobang.user.dto.PageMaker;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ReviewController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	
	@Autowired
	private ReviewBiz biz;
	
	@RequestMapping(value="/review_list.user")
	public String review(Model model, Criteria cri) {
		
		String email = "michaelhj@naver.com";
		
		logger.info("select Review user list");
		
		cri.setLoginemail(email);
		
		model.addAttribute("list", biz.selectListReview(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(biz.listCountUser(email));
		model.addAttribute("pageMaker", pageMaker);
		
		return "user/user_review";
	}
	
	
	

	
	
	
}
