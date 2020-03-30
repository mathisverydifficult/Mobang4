package com.finalproject.mobang.agent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalproject.mobang.admin.controller.AdminController;
import com.finalproject.mobang.agent.biz.AgentNoticeBiz;
import com.finalproject.mobang.agent.dto.AgentNoticeDto;
import com.finalproject.mobang.agent.dto.Criteria;
import com.finalproject.mobang.agent.dto.PageMaker;

@Controller
public class AgentController {
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);
	
	@Autowired
	private AgentNoticeBiz biz;
	
	@RequestMapping(value="/agent_home.agent")
	public String adminUser(Model model) {
		return "/agent/agent_home";
	}
	
	// 공지사항 목록 조회
	@RequestMapping(value="/noticelist.agent", method = RequestMethod.GET)
	public String noticeList(Model model,Criteria cri) {
		logger.info("select notice list");
		
		model.addAttribute("list", biz.selectList(cri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(biz.listCount());
		
		model.addAttribute("cri", cri);
		model.addAttribute("pageMaker", pageMaker);
		
		return "/agent/agent_notice";
	}
	
	// 공지사항 selectOne
	@RequestMapping(value="/selectone.agent",method = RequestMethod.GET)
	public String noticeSelectOne(Model model,int seq_nt,@ModelAttribute("cri") Criteria cri) {
		logger.info("notice - selectOne");
		
		AgentNoticeDto dto = biz.selectOne(seq_nt);
		model.addAttribute("dto", dto);
		model.addAttribute("cri", cri);
		
		
		return "/agent/agent_notice_selectone";
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
