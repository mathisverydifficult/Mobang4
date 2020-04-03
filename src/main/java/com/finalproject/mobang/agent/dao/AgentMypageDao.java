package com.finalproject.mobang.agent.dao;

import com.finalproject.mobang.agent.dto.AgentAccountDto;

public interface AgentMypageDao {
	String NAMESPACE = "mypage.";
	
	public AgentAccountDto selectAccount(String email);

}
