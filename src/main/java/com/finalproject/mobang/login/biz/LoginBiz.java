package com.finalproject.mobang.login.biz;

import java.util.Map;

import com.finalproject.mobang.login.dto.LoginDto;

public interface LoginBiz {

	public LoginDto selectUser(String email);
	public int userInsert(LoginDto dto);
	public int agentInsert(LoginDto dto);
	public int userUpdate(LoginDto dto);
	public int agentUpdate(LoginDto dto);
	public int updatePwd(Map<String, String> map);
}
