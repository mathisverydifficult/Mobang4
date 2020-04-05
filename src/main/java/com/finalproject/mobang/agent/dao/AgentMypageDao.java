package com.finalproject.mobang.agent.dao;

import java.util.List;

import com.finalproject.mobang.agent.dto.AgentAccountDto;
import com.finalproject.mobang.agent.dto.AgentProductDto;

public interface AgentMypageDao {
	String NAMESPACE = "mypage.";
	
	public AgentAccountDto selectAccount(String email);
	public List<AgentProductDto> selectProductList(String email);
	
}
