package com.finalproject.mobang.agent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.mobang.agent.biz.AgentMypageBiz;
import com.finalproject.mobang.agent.dto.AgentAccountDto;
import com.finalproject.mobang.agent.dto.AgentProductDto;
import com.finalproject.mobang.common.utils.CurrentUserName;

@Controller
public class AgentMypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);
	
	@Autowired
	private AgentMypageBiz biz;
	
	@RequestMapping(value="/agent_mypage.agent")
	public String mypage(Model model) {
		
		String email = CurrentUserName.currentUserName();
		// 계정관리
		AgentAccountDto accountdto = biz.selectAccount(email);
		model.addAttribute("account", accountdto);
		
		// 상품관리
		model.addAttribute("productlist", biz.selectProductList(email));
		
		// 리뷰관리
		model.addAttribute("reviewlist", biz.selectReviewList(email));
		
		// 문의관리
		model.addAttribute("qnalist", biz.selectQnaList(email));
		
		return "/agent/agent_mypage";
	}

	@RequestMapping(value="/agent_mypageproduct.agent")
	public String mypageproduct(Model model) {
		String email = CurrentUserName.currentUserName();
		AgentAccountDto accountdto = biz.selectAccount(email);
		model.addAttribute("account", accountdto);
		model.addAttribute("id", "product");
		
		// 상품관리
		model.addAttribute("productlist", biz.selectProductList(email));
		
		// 리뷰관리
		model.addAttribute("reviewlist", biz.selectReviewList(email));
		
		// 문의관리
		model.addAttribute("qnalist", biz.selectQnaList(email));
		
		return "/agent/agent_mypage";
	}
}
