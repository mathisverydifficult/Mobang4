package com.finalproject.mobang.common.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.util.WebUtils;

import com.finalproject.mobang.common.biz.FileBiz;
import com.finalproject.mobang.common.dto.UploadFile;
import com.finalproject.mobang.common.utils.FileValidator;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private FileValidator fileValidator;
	
	@Autowired
	private FileBiz biz;
	// servlet-context.xml에서 설정했던 uploadPath 외부서버에서 사용할 때 사용하자
//	@Resource(name="uploadPath")
//	private String uploadPath;
	
	@RequestMapping("/file.all")
	public String fileform() {
		return "/common/fileform";
	}
	
	@RequestMapping("/insertfile.all")
	public String fileUpload(HttpServletRequest request, Model model, UploadFile uploadFile, BindingResult result) {
		fileValidator.validate(uploadFile, result);
		if(result.hasErrors()) {
			return "/common/fileform";
		}
		// form에서 post 방식으로 넘어온 객체의 파일
		MultipartFile file = uploadFile.getMpfile();
		String name = file.getOriginalFilename();
		logger.info("원본 파일명 : "+name);
		
		
		// 파일 저장하는 과정
		InputStream inputStream = null;
		OutputStream outputStream = null;
/*		외부 서버에 올릴 때는 이런식으로 지정해야할껄?
		String imgUploadPath = uploadPath + File.separator+"imgUpload"; */
		UUID uid = UUID.randomUUID();
		String newFileName = uid+"_"+name;
		// 폴더에 저장할 이름
		try {
			inputStream = file.getInputStream();
			String path = WebUtils.getRealPath(request.getSession().getServletContext(), "resources\\storage");
			System.out.println("upload real path : "+path);
			
			
			File storage = new File(path);
			if(!storage.exists()) {
				storage.mkdir();
			}
			// 폴더에 파일을 만드는 것.
			File newFile = new File(path+"\\"+newFileName);
			// 넘기는 곳에서 이미지 불러올 때... 임시라서 다른 방법 생각해야댐
			model.addAttribute("imagepath","resources\\storage\\"+newFileName);
			
			if(!newFile.exists()) {
				newFile.createNewFile();
			}
			outputStream = new FileOutputStream(newFile);
			// 파일이 안읽어지면 확인할 용도
			int read =0;
			byte[] b = new byte[(int)file.getSize()];
			while((read=inputStream.read(b)) != -1) {
				outputStream.write(b,0,read);
			}
						
			
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
		// 컨트롤러에서 넘길 객체 만드는 과정 - 우린 필요하니?
		UploadFile fileObj = new UploadFile();
		fileObj.setName(newFileName);
		fileObj.setContent(uploadFile.getContent());
		model.addAttribute("fileObj",fileObj);
		
		
		int res =0;
		res=biz.insert(fileObj);
		if(res>0) {
			logger.info("글 작성 성공");
			
			// db에 저장된 정보 빼오기!
			
			UploadFile dto = biz.selectone(newFileName);
			model.addAttribute("dto",dto);
			
			
			return "/common/filedetail";
		}
		logger.info("글 작성 실패");
		return  "/common/fileform";
		
		
		
	}
	
	@RequestMapping("/download.all")
	@ResponseBody
	public byte[] fileDownload(HttpServletRequest request, HttpServletResponse response, String name) {
		byte[] down =null;
		
		try {
			String path= WebUtils.getRealPath(request.getSession().getServletContext(), "\\storage");
			// 경로에서 파일을 불러옴
			File file = new File(path+"\\"+name);
			
			
			down = FileCopyUtils.copyToByteArray(file);
			String filename = new String(file.getName().getBytes(), "8859_1"); // 8859_1 이클립스가 사용하고 있는 인코딩 방법? 찾아보자.
			
			response.setHeader("Content-Disposition", "attachment; filename=\""+filename+"\"");
			response.setContentLength(down.length);
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			
		}
		return down;
		// 바이트가 넘어옴... 이름을 설정해서 오기 때문에 파일을 다운받을 수 있게 됨
	}
	
	
}
