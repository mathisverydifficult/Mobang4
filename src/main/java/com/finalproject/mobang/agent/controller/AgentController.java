package com.finalproject.mobang.agent.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.finalproject.mobang.admin.controller.AdminController;
import com.finalproject.mobang.agent.biz.AgentMypageBiz;
import com.finalproject.mobang.agent.biz.AgentNoticeBiz;
import com.finalproject.mobang.agent.biz.AgentPayBiz;
import com.finalproject.mobang.agent.dto.AgentAccountDto;
import com.finalproject.mobang.agent.dto.AgentItemDto;
import com.finalproject.mobang.agent.dto.AgentNoticeDto;
import com.finalproject.mobang.agent.dto.AgentPayDto;
import com.finalproject.mobang.agent.dto.Criteria;
import com.finalproject.mobang.agent.dto.PageMaker;
import com.finalproject.mobang.common.utils.CurrentUserName;

@Controller
public class AgentController {
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);
	
	@Autowired
	private AgentNoticeBiz biz;
	@Autowired
	private AgentPayBiz userbiz;
	
	
	@RequestMapping(value="/agent_home.all")
	public String adminUser(Model model) {
		return "/agent/agent_home";
	}
	
	// 공지사항 목록 조회
	@RequestMapping(value="/noticelist.all", method = RequestMethod.GET)
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
	
	@RequestMapping(value="/fnq.all")
	public String fnq(Model model) {
		
		return "/agent/agent_fnq";
	}
	
	@RequestMapping(value ="/agent_sales.all")
	public String sales(Model model) {
		return "/agent/agent_sales";
	}
	
	@RequestMapping(value="/agent_premium_sales.all")
	public String premiumsale(Model model) {
		return "/agent/agent_premium_sales";
	}
	
	@RequestMapping(value = "/agent_pay.agent")
	public String agentPay(AgentItemDto dto, Model model) {
		model.addAttribute("dto", dto);
		return "/agent/agent_pay";
	}
	
	@RequestMapping(value = "/agent_sales_complete.agent")
	public String agentSalesComplete(Model model) {
		
		return "/agent/agent_sales_complete";
	}
}







////서머노트 insertres(save)   
//@RequestMapping(value ="/save.do", method = {RequestMethod.POST, RequestMethod.GET})   // button태그에서 보낸 onclick함수 경로
//public String save(RedirectAttributes redirect, NoteDto dto) {
////   RedirectAttributes redirect
//   logger.info("서머노트 insert는 잘 되었나요? dto : "+dto);
//   
//   if(dto.getNtitle() instanceof String) {
//      logger.info("ntitle은 String입니다.");            //당첨
//   } else if (dto.getNtitle() instanceof Object) {
//      logger.info("ntitle은 object입니다.");
//   } else if (dto.getNtitle() == null) { 
//      logger.info("ntitle은 null값입니다.");
//   } else {
//      logger.info("ntitle은 String도 object도 null도 아닙니다.");
//   }
//
//   int resNno = notebiz.insert(dto);   // 0or1이 아니라 nno번호로 나올거에요
//
////시퀀스 번호를 seq.nextval, 이런걸로 해당 저장된 값 확인, 그걸 토대로 nno.
////   notebiz.selectOne(nno);
//   
//   //Stringify사용해서 object -> 문자열로.
//   
//   //처리해주고 화면전환
//   if(resNno > 0) {
//      return "redirect: user_meetinglogdetail.do?nno="+resNno;   //controller로 다시 ...
////      return "redirect: /user_meetinglogdetail?nno="+ 변수명;
//   }else {
//          logger.info("ㅠ ㅠ 서머노트 insert Controller에서 안넘어감");
//      return "redirect:user_list.do";
//   }
//   //테이블
//   //model.addAttribute("dto", notebiz.insert(dto));
//}
//--------------------------------------------------------------------------------------------------
//@RequestMapping(value="/user_meetinglogdetail.do")
//public ModelAndView userMeetinglogdetail(HttpServletRequest request, ModelAndView mv, int nno) {
//   logger.info("mv를 사용해서 user_meetinglogdetail 페이지로 갈겁니다.");
//   
//   mv.addObject("select", notebiz.selectOne(nno));
//   mv.setViewName("./user_meetinglogdetail");
//   
//   return mv;
//}