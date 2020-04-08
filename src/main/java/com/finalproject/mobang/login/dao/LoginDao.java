package com.finalproject.mobang.login.dao;

import java.util.Map;

import com.finalproject.mobang.login.dto.LoginDto;

public interface LoginDao {

	String NAMESPACE = "login.";
	
	public LoginDto selectUser(String email);
	public int userInsert(LoginDto dto);
	public int agentInsert(LoginDto dto);
	public int userUpdate(LoginDto dto);
	public int agentUpdate(LoginDto dto);
	public int updatePwd(Map<String, String> map);
}
