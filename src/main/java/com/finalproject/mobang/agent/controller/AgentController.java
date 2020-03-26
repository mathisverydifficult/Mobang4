package com.finalproject.mobang.agent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalproject.mobang.admin.controller.AdminController;

@Controller
public class AgentController {
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);

	@RequestMapping(value="/agent_home.agent")
	public String adminUser(Model model) {
		return "/agent/agent_home";
	}
	
	@RequestMapping(value="/notice.agent")
	public String notice(Model model) {
		
		return "/agent/agent_notice";
	}
	
	@RequestMapping(value="/fnq.agent")
	public String fnq(Model model) {
		
		return "/agent/agent_fnq";
	}
	
	@RequestMapping(value="/roommanage.agent")
	public String roommanage(Model model) {
		
		return "/agent/agent_roommanage";
	}
	
	@RequestMapping(value ="/agent_sales.agent")
	public String sales(Model model) {
			
		return "/agent/agent_sales";
	}
	@RequestMapping(value="/agent_roominsert.agent")
	public String roominsert(Model model) {
		
		return "/agent/agent_roominsert";
	}
	
	@RequestMapping(value = "/agent_roomcomplete.agent")
	public String roomComplete(Model model) {
		
		return "/agent/agent_roomcomplete";
	}
	
	@RequestMapping(value="/agent_premium.agent")
	public String premiumsale(Model model) {
		return "/agent/agent_premium_sales";
	}
	
	@RequestMapping(value="/mypage.agent")
	public String mypage(Model model) {
		return "/agent/agent_mypage";
	}
}
