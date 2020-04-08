package com.finalproject.mobang.agent.dao;

import java.util.List;

import com.finalproject.mobang.agent.dto.AgentAccountDto;
import com.finalproject.mobang.agent.dto.AgentProductDto;
import com.finalproject.mobang.agent.dto.AgentReviewDto;

public interface AgentMypageDao {
	String NAMESPACE = "mypage.";
	
	public AgentAccountDto selectAccount(String email);
	public List<AgentProductDto> selectProductList(String email);
	public List<AgentReviewDto> selectReviewList(String agemail);
	public List<AgentReviewDto> selectQnaList(String email);
	
}
