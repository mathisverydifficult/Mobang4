package com.finalproject.mobang.common.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalproject.mobang.agent.controller.AgentController;
import com.finalproject.mobang.common.biz.RoomBiz;
import com.finalproject.mobang.common.dto.Criteria;
import com.finalproject.mobang.common.dto.PageMaker;
import com.finalproject.mobang.common.dto.RoomDto;

@Controller
public class RoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);
	
	@Autowired
	private RoomBiz biz;
	
	// 매물관리 바로가기(매물 수,구매한 광고,방리스트)
	@RequestMapping(value="/roommanage.agent",method = RequestMethod.GET)
	public String roommanage(Model model,Criteria cri,String email) {
		logger.info("select agent room list");
		
		model.addAttribute("list", biz.selectAgentList(cri,email));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(biz.listCount(email));
		System.out.println(cri);
		System.out.println(cri.getRowStart());
		System.out.println(pageMaker.getCri());
		
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", pageMaker);
		
		// System.out.println(biz.selectAgentList(cri,email));
		return "/agent/agent_roommanage";
	}
	
	// 방올리기
	@RequestMapping(value="/agent_roominsert.agent")
	public String roominsert(Model model) {
		
		
		return "/agent/agent_roominsert";
	}
	@RequestMapping(value="/roominsertres.agent")
	public String roominsertres(Model model,RoomDto dto) {
		logger.info("insert result");
		
		int res=biz.insert(dto);

		if(res>0) {
			return "/agent/agent_roomcomplete";
		}else {
			return "redirect:agent_roominsert.agent";
		}
	}
	
	
	
	@RequestMapping(value = "/agent_roomcomplete.agent")
	public String roomComplete(Model model) {
		
		return "/agent/agent_roomcomplete";
	}
	
	
}
