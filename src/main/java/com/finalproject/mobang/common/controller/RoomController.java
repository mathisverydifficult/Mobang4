package com.finalproject.mobang.common.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.finalproject.mobang.agent.controller.AgentController;
import com.finalproject.mobang.common.biz.RoomBiz;
import com.finalproject.mobang.common.dto.Criteria;
import com.finalproject.mobang.common.dto.PageMaker;
import com.finalproject.mobang.common.dto.RoomDto;
import com.finalproject.mobang.common.dto.UploadFile;
import com.finalproject.mobang.common.utils.CurrentUserName;
import com.finalproject.mobang.common.utils.FileListMaker;

@Controller
public class RoomController {
	
	private static final Logger logger = LoggerFactory.getLogger(AgentController.class);
	
	@Autowired
	private RoomBiz biz;
	
	// 매물관리 바로가기(매물 수,구매한 광고,방리스트)
	@RequestMapping(value="/roommanage.agent",method = RequestMethod.GET)
	public String roommanage(Model model,Criteria cri) {
		logger.info("select agent room list");
		String email = CurrentUserName.currentUserName();
		//System.out.println(email);
		logger.info(email);
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
	
	// 방올리기 페이지이동
	@RequestMapping(value="/agent_roominsert.agent")
	public String roominsert() {
		return "/agent/agent_roominsert";
	}
	
	// 방올리기 res
/*	
	@RequestMapping(value="/roominsertres.agent", method={RequestMethod.POST, RequestMethod.GET})
	public String roominsertres(RedirectAttributes redirect,RoomDto dto) {
		logger.info("방 insert result 컨트롤러");
		
		int resNo_rm=biz.insert(dto);

		if(resNo_rm>0) {
			return "redirect:agent_roomcomplete.agent?no_rm="+resNo_rm;
		}else {
			logger.info("방인서트 실패 컨트롤러");
			return "redirect:agent_roominsert.agent";
		}
	}
*/	
	@RequestMapping(value = "/roominsertres.agent")
    public String roominsert(MultipartHttpServletRequest mtfRequest, Model model, RedirectAttributes redirect,RoomDto dto) {
		logger.info("방 insert result 컨트롤러");
        List<MultipartFile> fileList = mtfRequest.getFiles("file");
        
       
        String path;
     // 파일 저장하는 과정
        InputStream inputStream = null;
		OutputStream outputStream = null;
		StringBuffer sb = new StringBuffer();
		try {
			path = WebUtils.getRealPath(mtfRequest.getSession().getServletContext(), "resources\\storage");
			for (MultipartFile mf : fileList) {
				
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			    logger.info("원본 파일명 : "+originFileName);
			    UUID uid = UUID.randomUUID();
				String newFileName = uid+"_"+originFileName;
				// db에 저장하기 위한 값을 만들어주는 것.
				sb.append("resources\\storage\\"+newFileName+"/_/");
				
				logger.info("저장된 파일명 : "+newFileName);
				inputStream = mf.getInputStream();
				
				File storage = new File(path);
				if(!storage.exists()) {
					storage.mkdir();
				}
				// 폴더에 파일을 만드는 것.
				File newFile = new File(path+"\\"+newFileName);
				if(!newFile.exists()) {
					newFile.createNewFile();
				}
				
				outputStream = new FileOutputStream(newFile);
				// 파일이 안읽어지면 확인할 용도
				int read =0;
				byte[] b = new byte[(int)mf.getSize()];
				while((read=inputStream.read(b)) != -1) {
					outputStream.write(b,0,read);
				}
				logger.info("파일 정상적으로 입력됨");
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				inputStream.close();
				outputStream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		String result = sb.toString();
		String[] array =result.split("/_/");
		for(int i=0; i<array.length; i++) {
			logger.info(array[i]);
		}
		dto.setPicture_rm(result);
		String email = CurrentUserName.currentUserName();
		dto.setEmail(email); // 아이디를 받아와보자.
		logger.info("dto.getPicture_rm"+ dto.getPicture_rm());
		logger.info("dto.getTitle_rm"+dto.getTitle_rm());
		logger.info("dto.getPicture_rm()"+dto.getPicture_rm());
		logger.info("dto.getAnimal_rm()"+dto.getAnimal_rm());
		logger.info("dto.getElevator_rm()"+dto.getElevator_rm());
		logger.info("dto.getRoomtype_rm()"+dto.getRoomtype_rm());

		
		
		int resNo_rm=biz.insert(dto);
		
		if(resNo_rm>0) {
			return "redirect:agent_roomcomplete.agent?no_rm="+resNo_rm;
		}else {
			logger.info("방인서트 실패 컨트롤러");
			return "redirect:agent_roominsert.agent";
		}
		
		
		
    }
	
	
	// 방올리기 완료페이지...일종의 select one?
	// 사진은 
	@RequestMapping(value = "/agent_roomcomplete.agent")
	public ModelAndView roomComplete(HttpServletRequest request, ModelAndView mv, int no_rm) {
		logger.info("no_rm의 값 : "+no_rm);
		logger.info("mv를 사용해서 방올리기 완료페이지");

		RoomDto dto = biz.selectOne(no_rm);
		// 사진들의 이름이 저장된 column에서 값 불러오고 (***.jpg//###.png//)
		String filename = dto.getPicture_rm(); 
		// 페이지에 list로 파일명을 분리해서 보내줌 .
		List<String> imagelist = FileListMaker.fileListMaker(filename);
		// 파일 리스트를 객체에 담아 보내준다.
		mv.addObject("imagelist",imagelist);
		// 올린 방의 정보를 담아서 보내주는 객체
		mv.addObject("dto", dto);

		mv.setViewName("/agent/agent_roomcomplete");
		
		return mv;
	}
	
	// 방 상세페이지
	@RequestMapping(value = "/agent_roomdetail.agent")
	public ModelAndView roomdetail(ModelAndView mv,int no_rm) {
		logger.info("mv를 사용해서 방 상세페이지");
		mv.addObject("dto", biz.selectOne(no_rm));
		mv.setViewName("/agent/agent_roomdetail");
		return mv;
	}
	
	// 방 수정하기
	@RequestMapping(value="/agent_roomupdate.agent")
	public ModelAndView roomupdate(ModelAndView mv,int no_rm) {
		logger.info("update form컨트롤러");
		mv.addObject("updatedto", biz.selectOne(no_rm));
		mv.setViewName("/agent/agent_roomupdateform");
		
		return mv;
	}
	
	// 방 수정 res
	@RequestMapping(value="/agent_roomupdateres.agent", method={RequestMethod.POST, RequestMethod.GET})
	public String updateRes(Model model,RoomDto dto) {
		logger.info("updateres controller");
		int res=biz.update(dto);
		if(res>0) {
			return "redirect:agent_roomdetail.agent?no_rm="+dto.getNo_rm();
		}else {
			return "redirect:agent_roomupdate.agent?myno="+dto.getNo_rm();
		}
		
	}
	
	
	// 방 삭제
	@RequestMapping("/agent_roomdelete.agent")
	public ModelAndView roomdelete(ModelAndView mv,int no_rm) {
		logger.info("roomdelete controller");
		
		int res=biz.delete(no_rm);
		if(res>0) {
			mv.setViewName("redirect:/roommanage.agent");
		}else {
			mv.setViewName("redirect:/agent_roomdetail.agent?no_rm="+no_rm);
		}
		
		return mv;
	}
	
	
	
}
