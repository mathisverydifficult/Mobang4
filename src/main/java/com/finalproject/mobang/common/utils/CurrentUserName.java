package com.finalproject.mobang.common.utils;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;

public class CurrentUserName {
	
	public static String currentUserName() { 
	      Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
	      User user = (User) authentication.getPrincipal();
	      
	      return user.getUsername(); 
	   }

}
}