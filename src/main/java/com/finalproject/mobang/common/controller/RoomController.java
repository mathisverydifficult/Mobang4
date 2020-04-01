package com.finalproject.mobang.common.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String roominsert() {
		return "/agent/agent_roominsert";
	}
	
	
	@RequestMapping(value="/roominsertres.agent", method={RequestMethod.POST, RequestMethod.GET})
	public String roominsertres(RedirectAttributes redirect,RoomDto dto) {
		logger.info("방 insert result 컨트롤러");
		
		int resNo_rm=biz.insert(dto);

		if(resNo_rm>0) {
			return "redirect:agent_roomcomplete.agent?no_rm"+resNo_rm;
		}else {
			logger.info("방인서트 실패 컨트롤러");
			return "redirect:agent_roominsert.agent";
		}
	}
	
	
	// 방올리기 완료페이지...일종의 select one?
	@RequestMapping(value = "/agent_roomcomplete.agent")
	public ModelAndView roomComplete(ModelAndView mv, int no_rm) {
		logger.info("mv를 사용해서 방올리기 완료페이지");
		mv.addObject("dto", biz.insertcomplete(no_rm));
		mv.setViewName("/agent/agent_roomcomplete");
		
		return mv;
	}
	
	
}
