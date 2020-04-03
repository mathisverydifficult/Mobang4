package com.finalproject.mobang.agent.biz;

import java.util.List;

import com.finalproject.mobang.agent.dto.AgentAccountDto;
import com.finalproject.mobang.agent.dto.AgentProductDto;

public interface AgentMypageBiz {
	
	public AgentAccountDto selectAccount(String email);
	public List<AgentProductDto> selectProductList(String email);

}
