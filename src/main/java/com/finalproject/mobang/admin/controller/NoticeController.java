package com.finalproject.mobang.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.finalproject.mobang.admin.biz.NoticeBoardBiz;
import com.finalproject.mobang.admin.dto.Criteria;
import com.finalproject.mobang.admin.dto.PageMaker;
import com.finalproject.mobang.admin.dto.QnaBoardDto;
import com.finalproject.mobang.agent.dto.AgentNoticeDto;

@Controller
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	
	@Autowired
	private NoticeBoardBiz noticebiz;
	
	
	// 공지사항 목록 조회
		@RequestMapping(value="/notice_list.admin", method = RequestMethod.GET)
		public String noticeList(Model model,Criteria cri) {
			logger.info("select notice list");
			
			model.addAttribute("list", noticebiz.selectList(cri));
			
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			pageMaker.setTotalCount(noticebiz.listCount());
			
			model.addAttribute("pageMaker", pageMaker);
			
			return "/admin/admin_notice";
		}
	
		@RequestMapping(value="/notice_selectone.admin",method = RequestMethod.GET)
		public String noticeSelectOne(Model model,int seq_nt) {
			logger.info("notice - selectOne");
			
			AgentNoticeDto dto = noticebiz.selectOne(seq_nt);
			model.addAttribute("dto", dto);
			
			return "/admin/admin_notice_detail";
		}
		
		// 글쓰기 폼으로 이동
		@RequestMapping(value="/notice_insertform.admin")
		public String noticeInsertform() {
			logger.info("notice - insertform");
			
			return "/admin/admin_notice_insert";
		}
		
		// qna 글작성
		@RequestMapping(value="/notice_insert.admin")
		public String noticeInsert(Model model, AgentNoticeDto dto) {
			logger.info("qna - insert");
			
			int res = noticebiz.insert(dto);
			
			model.addAttribute("dto",dto);
			
			if (res>0) {
				logger.info("글작성성공");
				return "redirect:notice_list.admin";
			}
			
			logger.info("글작성 실패");
			return "/admin/admin_notice_insert";
		}
		
			
		// qna 게시판 글수정 폼으로 이동
		@RequestMapping(value="/notice_update.admin")
		public ModelAndView qnaUpdate(int seq_nt) {
			logger.info("update");
			ModelAndView mv =new ModelAndView();
			AgentNoticeDto dto = noticebiz.selectOne(seq_nt);
			mv.setViewName("admin/admin_notice_update");
			mv.addObject("dto",dto);
			return mv;
		}
		// qna 게시판에서 업데이트를 처리해 줌 
		@RequestMapping(value="/notice_updateres.admin")
		public String updateform(AgentNoticeDto dto) {
			logger.info("updateres");
			
			int res = noticebiz.update(dto);
			if (res>0) {
				return "redirect:notice_selectone.admin?seq_nt="+dto.getSeq_nt();
				
			} else {
				return "redirect:notice_selectone.admin";
			}
		}
		
		// qna 상세보기에서 글 삭제
		@RequestMapping(value="/notice_delete.admin")
		public String qnaDelete(int seq_nt) {
			logger.info("qna - delete");
			int res = noticebiz.delete(seq_nt);
			
			if(res>0) {
				return "redirect:notice_list.admin";
			}
			return "notice_selectone.admin?seq_nt="+seq_nt;
		}
		
		// qna 게시판에서 글 여러개 삭제

		@RequestMapping(value="/notice_multidelete.admin")
		public String qnaMultiDelete(@RequestParam("chk") String[] chk) throws Exception {
			logger.info("notice - multidelete");
			
			for (String seqQ : chk) {
				int seq_q = Integer.parseInt(seqQ);
				int res = noticebiz.delete(seq_q); 
				if (res>0) {
					System.out.println("글"+seq_q+"번 삭제 성공");
				}
			} // 목록 페이지로 이동 
			return "redirect:notice_list.admin";

			
		}
		
		
		
}
