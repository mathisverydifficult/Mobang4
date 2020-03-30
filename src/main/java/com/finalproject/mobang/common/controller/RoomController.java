package com.finalproject.mobang.common.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.finalproject.mobang.common.biz.RoomBiz;

@Controller
public class RoomController {
	
	private Logger logger = LoggerFactory.getLogger(RoomController.class);
	
	@Autowired
	private RoomBiz biz;
	
	
}
