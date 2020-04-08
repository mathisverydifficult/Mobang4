package com.finalproject.mobang.agent.biz;


import com.finalproject.mobang.agent.dto.AgentAccountDto;

public interface AgentPayBiz {
	
	public AgentAccountDto selectAccount(String email);

}
