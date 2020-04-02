package com.finalproject.mobang.agent.biz;

import com.finalproject.mobang.agent.dto.AgentAccountDto;

public interface AgentMypageBiz {
	
	public AgentAccountDto selectAccount(String email);

}
