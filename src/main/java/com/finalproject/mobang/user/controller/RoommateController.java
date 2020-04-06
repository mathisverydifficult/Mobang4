package com.finalproject.mobang.user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RoommateController {

	@RequestMapping(value="/roommate_recommand.user")
	public String RoommateRecommand(Model model) {
		
		return "user/roommate_recommand";
	}
	
}
