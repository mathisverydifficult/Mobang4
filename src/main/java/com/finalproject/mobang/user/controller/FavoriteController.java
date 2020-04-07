	package com.finalproject.mobang.user.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalproject.mobang.common.utils.CurrentUserName;
import com.finalproject.mobang.common.utils.FileListMaker;
import com.finalproject.mobang.user.biz.FavoriteBiz;
import com.finalproject.mobang.user.biz.roomsearchBiz;
import com.finalproject.mobang.user.dto.FavoriteDto;
import com.finalproject.mobang.user.dto.roomsearchDto;

/**
 * Handles requests for the application home page.
 */
@Controller
public class FavoriteController {
	
	private static final Logger logger = LoggerFactory.getLogger(FavoriteController.class);
	
	@Autowired
	private FavoriteBiz biz;
	@Autowired
	private roomsearchBiz roombiz;
	
	@RequestMapping(value="/favorite_recent.user")
	public String UserRecent(Model model) {
		logger.info("사용자가 최근에 본 방");
		
		try {
			String email = CurrentUserName.currentUserName();
			logger.info("email : "+ email);
			List<roomsearchDto> list = roombiz.recentList(email);
			list.size();
			for(int i=0; i<list.size(); i++) {
				logger.info(list.get(i).getPicture_rm());
			}
			
			model.addAttribute("list", roombiz.recentList(email));
			
			model.addAttribute("count",biz.recentCount(email));
		} catch (Exception e) {
			logger.info("이메일이 없거나 객체에 값을 못담음");
			e.printStackTrace();
		}
		
		
		return "user/favorite_recent";
		
	}
	
	@ResponseBody								//값만 이동시 ResponseBody
	@RequestMapping(value="/dibs_insert.user")
	public int favoritedibs(FavoriteDto favoriteDto) {
		
		
		favoriteDto.setEmail(CurrentUserName.currentUserName());
		
		int res = 0;
		
		res = biz.insertDibs(favoriteDto);
		
		return res;			//리턴타입 String아니므로 페이지 이동이 아닌 값만 보냄
	}
	
	@ResponseBody
	@RequestMapping(value="/dibs_delete.user")
	public int dibsdelete(FavoriteDto favoriteDto) {
		
		favoriteDto.setEmail(CurrentUserName.currentUserName());
		
		int res = 0;
		
		res = biz.deleteDibs(favoriteDto);
		
		return res;			//리턴타입 String아니므로 페이지 이동이 아닌 값만 보냄
	}
	
	@RequestMapping(value="/favorite_dibs.user")
	public String UserDibs(Model model) {
		logger.info("사용자가 최근에 찜한 방");
		
		
		try {
			String email = CurrentUserName.currentUserName();
			logger.info("email : "+ email);
			List<roomsearchDto> list = roombiz.dibList(email);
			List<String> imagelist = new ArrayList<String>();
			for(int i =0; i<list.size(); i++) {
				logger.info("imagepath : " + list.get(i).getPicture_rm().split("/_/")[0]);
				imagelist.add(list.get(i).getPicture_rm().split("/_/")[0]);
			}
			
			model.addAttribute("imagelist",imagelist);
			model.addAttribute("list", roombiz.dibList(email));
			model.addAttribute("count",biz.dibsCount(email));
		} catch (Exception e) {
			logger.info("이메일이 없거나 객체에 값을 못담음");
			e.printStackTrace();
		}
		
		return "user/favorite_dibs";
	}
	
}
