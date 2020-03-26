package com.finalproject.mobang.admin.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.finalproject.mobang.admin.biz.AccountBoardBiz;
import com.finalproject.mobang.admin.biz.QnaBoardBiz;
import com.finalproject.mobang.admin.common.FileValidator;
import com.finalproject.mobang.admin.common.Paging;
import com.finalproject.mobang.admin.dto.QnaBoardDto;
import com.finalproject.mobang.admin.dto.UploadFile;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	
	@Autowired
	private AccountBoardBiz accountbiz;
	@Autowired
	private QnaBoardBiz qnabiz;
	
	@Autowired
	private FileValidator fileValidator;
	
	// 계정관리 리스트 보기
	@RequestMapping(value="/admin_account.admin", method = RequestMethod.GET)
	public String adminUser(Model model) {
		logger.info("admin-account");
		model.addAttribute("list", accountbiz.selectList());
		return "/admin/admin_account";
	} 
	
	// 관리자 신고페이지
	@RequestMapping(value="/admin_report.admin" ,method = RequestMethod.GET)
	public String adminReport(Model model) {
		logger.info("admin-report");
		return "admin/admin_report";
	}
	
	// qna 게시판 리스트보기
/*	@RequestMapping(value="/admin_qna.admin", method = RequestMethod.GET)
	public String adminQna(@RequestParam(defaultValue="1") int curPage, Model model ) {
		logger.info("admin-qna");
		model.addAttribute("list", qnabiz.selectList());
		// 전체 리스트 개수
		int listCnt = qnabiz.listCount();
		Paging paging = new Paging(listCnt, curPage);
		
		return "admin/admin_qna";
	}
*/	
	// qna 게시판 리스트보기
		@RequestMapping(value="/admin_qna.admin", method = RequestMethod.GET)
		public String adminQna(Model model ) {
			logger.info("admin-qna");
			model.addAttribute("list", qnabiz.selectList());
			
			return "admin/admin_qna";
		}
	
	
	// qna 상세글 보기
	@RequestMapping(value="/qna_selectone.admin", method = RequestMethod.GET)
	public String qnaSelectOne(Model model, int seqQ) {
		logger.info("qna - selectOne");
		
		QnaBoardDto dto = qnabiz.selectOne(seqQ);
		model.addAttribute("dto",dto);
		return "/admin/admin_qna_detail";
	}
	
	// 글쓰기 폼으로 이동
	@RequestMapping(value="/qna_insertform.admin")
	public String qnaInsertform() {
		logger.info("qna - insertform");
		
		return "/admin/admin_qna_insert";
	}
	
	// qna 글작성
	@RequestMapping(value="/qna_insert.admin")
	public String qnaInsert(Model model, QnaBoardDto dto, HttpServletRequest request, UploadFile uploadFile, BindingResult result) throws Exception {
		logger.info("qna - insert");
		fileValidator.validate(uploadFile, result);
		
		if(result.hasErrors()) {
			return "/admin/admin_qna_insert";
		}
		MultipartFile file = uploadFile.getMpfile();
		
		String name = file.getOriginalFilename();
		
		// 컨트롤러에서 페이지로 넘길 객체 생성

		
		
		InputStream inputStream = null;
		OutputStream outputStream = null;
		
		try {
			inputStream = file.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "/storage");
			System.out.println("upload real path"+ path);
			
			File storage = new File(path);
			// 해당 폴더 없으면 만들어줘라.
			if(!storage.exists()) {
				storage.mkdir();
			}
			
			File newFile = new File(path+"/"+name);
			if(!newFile.exists()) {
				newFile.createNewFile();
			}
			outputStream = new FileOutputStream(newFile);
			
			int read =0;
			byte[] b = new byte[(int)file.getSize()];
			while((read=inputStream.read(b)) != -1) {
				// 자바 io에서 했던 것! 확실하게 마스터해야함!
				outputStream.write(b,0,read);
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch(IOException e) {
				e.printStackTrace();
			}
		}
		
		// 파일업로드 끝
		
		int res = qnabiz.insert(dto);
		
		model.addAttribute("dto",dto);
		
		if (res>0) {
			logger.info("글작성성공");
			return "redirect:admin_qna.admin";
		}
		
		logger.info("글작성 실패");
		return "/admin/admin_qna_insert";
	}
	
		
	// qna 게시판 글수정 폼으로 이동
	@RequestMapping(value="/qna_update.admin")
	public ModelAndView qnaUpdate(int seqQ) {
		logger.info("update");
		ModelAndView mv =new ModelAndView();
		QnaBoardDto dto = qnabiz.selectOne(seqQ);
		mv.setViewName("admin/admin_qna_update");
		mv.addObject("dto",dto);
		return mv;
	}
	// qna 게시판에서 업데이트를 처리해 줌 
	@RequestMapping(value="/qna_updateres.admin")
	public String updateform(QnaBoardDto dto) {
		logger.info("updateres");
		
		int res = qnabiz.update(dto);
		if (res>0) {
			return "redirect:qna_selectone.admin?seqQ="+dto.getSeqQ();
			
		} else {
			return "redirect:qna_selectone.admin";
		}
	}
	
	// qna 상세보기에서 글 삭제
	@RequestMapping(value="/qna_delete.admin")
	public String qnaDelete(int seqQ) {
		logger.info("qna - delete");
		int res = qnabiz.delete(seqQ);
		
		if(res>0) {
			return "redirect:admin_qna.admin";
		}
		return "qna_insertform.admin";
	}
	
	// qna 게시판에서 글 여러개 삭제

	@RequestMapping(value="/qna_multidelete.admin")
	public String qnaMultiDelete(@RequestParam("chk") String[] chk) throws Exception {
		logger.info("qna - multidelete");
		
		for (String seqQ : chk) {
			int seq_q = Integer.parseInt(seqQ);
			int res = qnabiz.delete(seq_q); 
			if (res>0) {
				System.out.println("글"+seq_q+"번 삭제 성공");
			}
		} // 목록 페이지로 이동 
		return "redirect:admin_qna.admin";

		
	}
	
	
	

		
		
	
}
