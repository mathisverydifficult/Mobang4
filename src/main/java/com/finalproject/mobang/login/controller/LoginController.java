package com.finalproject.mobang.login.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.finalproject.mobang.common.dto.RoomDto;
import com.finalproject.mobang.common.dto.UploadFile;
import com.finalproject.mobang.common.utils.CurrentUserName;
import com.finalproject.mobang.login.biz.LoginBiz;
import com.finalproject.mobang.login.biz.LoginBizImpl;
import com.finalproject.mobang.login.dto.LoginDto;
import com.finalproject.mobang.login.email.MailHandler;
import com.finalproject.mobang.user.biz.roomsearchBiz;
import com.finalproject.mobang.user.controller.HomeController;

@Controller
public class LoginController {

private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	LoginBiz biz;
	
	/* Email */
	@Autowired
	MailHandler mailService = new MailHandler();
	
	@RequestMapping(value = "/login.all")
	public String login(Locale locale, Model model) {
		logger.info("login");
		
		model.addAttribute("loginDto", new LoginDto());

		return "login/login";
	}
	
	@RequestMapping(value = "/agentlogin.all")
	public String agentlogin(Locale locale, Model model) {
		logger.info("agent_login");
		
		model.addAttribute("loginDto", new LoginDto());

		return "login/agent_login";
	}
	
	@RequestMapping(value = "/pwdfind.all")
	public String pwdfind(Locale locale, Model model, String email, String pwd) {
		logger.info("pwd find");
		
		System.out.println(email + "  " + pwd);
		Map<String, String> map = new HashMap<String, String>();
		map.put("email", email);
		map.put("pwd", "{noop}"+pwd);
		
		int res = 0;
		
		res = biz.updatePwd(map);
		
		if(res > 0) {
			return "login/login";
		} else {
			return "index";
		}
	}
	
	@RequestMapping(value = "/access_denied_page.all")
	public String access_denied_page(Locale locale, Model model) {
		logger.info("access_denied_page");

		return "login/access_denied_page";
	}
	
	@RequestMapping(value = "/usersignupform.all")
	public String usersignupform(Locale locale, Model model) {
		logger.info("usersignupform");
		
		model.addAttribute("loginDto", new LoginDto());
		
		return "login/user_signup";
	}
	
	@RequestMapping(value = "/usersignup.all", method = RequestMethod.POST)
	public String usersignup(Model model, @ModelAttribute("loginDto")@Valid LoginDto loginDto, BindingResult result,
			RedirectAttributes rttr, MultipartHttpServletRequest mtfRequest) {
		logger.info("usersignup");
		
		if(result.hasErrors()) {
			
			return "login/user_signup";
		} else {
			
			logger.info(loginDto.getRoommate());
			logger.info(loginDto.getUserfile());
			
			if(loginDto.getRoommate() != null) {
				
				loginDto.setPwd("{noop}"+loginDto.getPwd());
				
				logger.info("controller"+loginDto);
				
				//파일 업로드
				logger.info("user signup");
		        List<MultipartFile> fileList = mtfRequest.getFiles("multiuserfile");
		        
		       
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
				
				String resultFile = sb.toString();
				String[] array =resultFile.split("/_/");
				for(int i=0; i<array.length; i++) {
					logger.info(array[i]);
				}
				loginDto.setUserfile(resultFile);
				
				int res =biz.userInsert(loginDto);
				
				if(res > 0) {
					return "login/login";
				} else {
					logger.info("user 회원가입 실패");
					return "login/user_signup";
				}
			
			} else {
				System.out.println(loginDto.getPwd());
				
				loginDto.setPwd("{noop}"+loginDto.getPwd());
				loginDto.setClean("");
				loginDto.setLifestyle("");
				loginDto.setShower("");
				loginDto.setFavoriteage("");
				loginDto.setGender("");
				loginDto.setAnimal("");
				loginDto.setNeeds("");
				
				int res = biz.userInsert(loginDto);
				
				if(res > 0) {
					return "login/login";
				} else {
					return "login/user_signup";
				}
			}
		}
		
	}
	
	@RequestMapping(value = "/check.all")
	@ResponseBody
	public int check(Locale locale, Model model, String email) {
		logger.info("check");
		logger.info(email);
		
		LoginDto dto = biz.selectUser(email);
	
		try {
			if(dto.getEmail() != null) {
				return 1;
			} 
			return 0;
		} catch (NullPointerException e) {
			return 0;
		}
		 


		
		
	}
	
	@RequestMapping(value = "/agentsignupform.all")
	public String agentsignupform(Locale locale, Model model) {
		logger.info("agentsignupform");
		
		model.addAttribute("loginDto", new LoginDto());
		
		return "login/agent_signup";
	}
	
	@RequestMapping(value = "/agentsignup.all")
	public String agentsignup(Model model, @ModelAttribute("loginDto")@Valid LoginDto loginDto, BindingResult result,
			RedirectAttributes rttr, MultipartHttpServletRequest mtfRequest) {
		logger.info("agentsignup");
		
		model.addAttribute("dto", new LoginDto());
		
		if(result.hasErrors()) {
			return "login/agent_signup";
		} else {
			
			//파일 업로드
			logger.info("user signup");
	        List<MultipartFile> fileList = mtfRequest.getFiles("multiuserfile");
	        
	       
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
			
			String resultFile = sb.toString();
			String[] array =resultFile.split("/_/");
			for(int i=0; i<array.length; i++) {
				logger.info(array[i]);
			}
			loginDto.setUserfile(resultFile);
			
			loginDto.setPwd("{noop}"+loginDto.getPwd());
			int res = biz.agentInsert(loginDto);
				
			if(res > 0) {
				return "login/login";
			} else {
				return "login/agent_signup";
			}
		}
	}
	
	@RequestMapping(value = "/userupdateform.user")
	public String userupdateform(Locale locale, Model model) {
		logger.info("userupdateform");
		
		LoginDto dto = biz.selectUser(currentUserName());
		
		model.addAttribute("loginDto", dto);
		
		System.out.println(dto.getEmail());
		
		
		return "login/user_update";
	}
	
	@RequestMapping(value = "/userupdate.user")
	public String userupdate(Model model, @ModelAttribute("loginDto")@Valid LoginDto loginDto, BindingResult result,
			RedirectAttributes rttr) {
		logger.info("userupdate");	
		
		System.out.println("userupdate : "+ loginDto);
		
		if(result.hasErrors()) {
			return "login/user_update";
		} else {
			if(loginDto.getRoommate() != null) {

				
				
				loginDto.setPwd("{noop}"+loginDto.getPwd());
				
				System.out.println("controller" + loginDto);
				
				int res = biz.userUpdate(loginDto);
				
				if(res > 0) {
					return "login/user_update";
				} else {
					return "login/user_update";
				}
			} else {
				System.out.println(loginDto.getPwd());
				
				loginDto.setPwd("{noop}"+loginDto.getPwd());
				loginDto.setClean("");
				loginDto.setLifestyle("");
				loginDto.setShower("");
				loginDto.setFavoriteage("");
				loginDto.setGender("");
				loginDto.setAnimal("");
				loginDto.setNeeds("");
				
				System.out.println(loginDto.getPwd());
				
				int res = biz.userUpdate(loginDto);
				
				if(res > 0) {
					return "login/user_update";
				} else {
					return "login/user_update";
				}
			}
		}
	}
	
	@RequestMapping(value = "/agentupdateform.agent")
	public String agentupdateform(Locale locale, Model model) {
		logger.info("agentupdateform");
		
		LoginDto dto = biz.selectUser(currentUserName());
		
		model.addAttribute("loginDto", dto);
		
		return "login/agent_update";
	}
	
	@RequestMapping(value = "/agentupdate.agent")
	public String agentupdate(Model model, @ModelAttribute("loginDto")@Valid LoginDto loginDto, BindingResult result,
			RedirectAttributes rttr, MultipartHttpServletRequest mtfRequest) {
		logger.info("agentupdate");
	
		
		if(result.hasErrors()) {
			return "login/agent_update";
		} else {
			
			//파일 업로드
			logger.info("user signup");
	        List<MultipartFile> fileList = mtfRequest.getFiles("multiuserfile");
	        
	       
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
			
			String resultFile = sb.toString();
			String[] array =resultFile.split("/_/");
			for(int i=0; i<array.length; i++) {
				logger.info(array[i]);
			}
			loginDto.setUserfile(resultFile);
			
			loginDto.setPwd("{noop}"+loginDto.getPwd());
			
			System.out.println("contorller"+loginDto);
			
			int res = biz.agentUpdate(loginDto);
				
			if(res > 0) {
				return "login/login";
			} else {
				return "login/agent_update";
			}
		}
	}
	
	@RequestMapping(value="/email")
	public class emailController {
	
		@RequestMapping(value="/email.do")
		public ModelAndView board2(){
			ModelAndView mv = new ModelAndView();
			int ran = new Random().nextInt(900000) + 100000;
			mv.setViewName("test/email");
			mv.addObject("random", ran);
			return mv;
		}
	}
	
	@RequestMapping(value="/createEmailCheck.all")
		@ResponseBody
		public boolean createEmailCheck(@RequestParam String email, @RequestParam int random, HttpServletRequest req){
			//이메일 인증
			int ran = new Random().nextInt(900000) + 100000;
			
			
			HttpSession session = req.getSession(true);
			String authCode = String.valueOf(ran);
			
			session.setAttribute("authCode", authCode);
			session.setAttribute("random", random);
			
			String subject = "회원가입 인증 코드 발급 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			
			sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
			
			return mailService.send(subject, sb.toString(), "hyerin03158@gmail.com", email);
	}

	@RequestMapping(value="/emailAuth.all")
	@ResponseBody
	public ResponseEntity<String> emailAuth(@RequestParam String authCode, @RequestParam String random, HttpSession session){
		String originalJoinCode = (String) session.getAttribute("authCode");
		String originalRandom = Integer.toString((int) session.getAttribute("random"));
		
		if(originalJoinCode.equals(authCode) && originalRandom.equals(random)) {
			return new ResponseEntity<String>("complete", HttpStatus.OK);
		}
		else {
			return new ResponseEntity<String>("false", HttpStatus.OK);
		}
	}
	
	
	public static String currentUserName() { 
	      Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
	      User user = (User) authentication.getPrincipal();
	      
	      return user.getUsername(); 
	}
	
}
