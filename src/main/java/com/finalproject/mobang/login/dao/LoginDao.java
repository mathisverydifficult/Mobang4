package com.finalproject.mobang.login.dao;

import com.finalproject.mobang.login.dto.LoginDto;

public interface LoginDao {

	String NAMESPACE = "login.";
	
	public int userInsert(LoginDto dto);
}
