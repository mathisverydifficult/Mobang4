package com.finalproject.mobang.agent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.mobang.agent.biz.AgentMypageBiz;
import com.finalproject.mobang.agent.dto.AgentAccountDto;

@Controller
public class AgentMypageController {
	
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);
	
	@Autowired
	private AgentMypageBiz biz;
	
	@RequestMapping(value="/agent_mypage.agent")
	public String mypage(Model model,String email) {
		System.out.println(email);
		AgentAccountDto accountdto = biz.selectAccount(email);
		model.addAttribute("account", accountdto);
		
		return "/agent/agent_mypage";
	}

}
