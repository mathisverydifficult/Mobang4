package com.finalproject.mobang.user.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.mobang.common.utils.CurrentUserName;
import com.finalproject.mobang.user.biz.FavoriteBiz;
import com.finalproject.mobang.user.biz.roomsearchBiz;
import com.finalproject.mobang.user.dto.FavoriteDto;
import com.finalproject.mobang.user.dto.roomsearchDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private roomsearchBiz roombiz;
	@Autowired
	private FavoriteBiz favoritebiz;
	
	
	@RequestMapping(value = "/")
	public String home(Locale locale, Model model) {
		logger.info("home");
		
		return "user/user_home";
	}
	
	@ResponseBody															//ajax 통신으로 페이지 이동이 아닌 값만 가져올 경우 @ResponseBody
	@RequestMapping(value = "/diblist.user")
	public List<roomsearchDto> diblist() {
		
		logger.info(CurrentUserName.currentUserName());
		
		String email = CurrentUserName.currentUserName();
		
		List<roomsearchDto>test = roombiz.dibList(email);					//찜한방리스트만 (checkdib = 2)
		
		return test;														//리턴타입이 String이 아니므로 페이지 이동(->View Resolver)이 아닌 값만 보냄
	}
	
	@RequestMapping(value = "/home.all")
	public String mainhome(Locale locale, Model model, String email) {
		logger.info("home");
		
		model.addAttribute("list", roombiz.dibList(email));
		
		return "user/user_home";
	}
	
	@RequestMapping(value="/homesearch.all")
	public String homesearch(Model model, String keyword) {
		
		model.addAttribute("keyword", keyword);							//keyword : 검색어
		
		return "user/room_search";
	}
	
	
	@RequestMapping(value="/index.all")
	public String index(Model model) {
		
		return "index";
	}

	
	@ResponseBody															//데이터 조회시 붙이는 annotation
	@RequestMapping(value="/room_search.all")
	public List<roomsearchDto> roomsearch(Model model, String keyword) {	//viewResolver가 리턴타입이 String일때만 return값의 jsp를 찾아서 리턴.
		
		String email = CurrentUserName.currentUserName();
		
		List<roomsearchDto> test = roombiz.selectsearchList(keyword, email);
		
		return test;
	}
	
	@RequestMapping(value="/room_detail.all")
	public String roomdetail(Model model, int myno) {
		
		logger.info("select One");
		
		try {
			String email = CurrentUserName.currentUserName();
			
			logger.info(email);
			
			FavoriteDto dto = new FavoriteDto();
			dto.setEmail(email);
			dto.setRecentFv(myno);
			dto.setRoomEx("Y");
			logger.info("최근 본 방 추가");
			favoritebiz.insertRecent(dto);
		} catch (Exception e) {
			logger.info("로그인 안해서 안됨 본 방에 추가 안됨");
			e.printStackTrace();
		} 
		
		model.addAttribute("detail", roombiz.selectOne(myno));
		
		return "user/room_detail";
		
		
		
		
	}
	
	@RequestMapping(value="/review.user")
	public String review(Model model) {
		
		
		logger.info("select list");
		
		return "user/user_review";
	}
	
}
