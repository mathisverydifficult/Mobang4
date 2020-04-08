package com.finalproject.mobang.agent.dao;

import com.finalproject.mobang.agent.dto.AgentAccountDto;

public interface AgentPayDao {
	String NAMESPACE = "pay.";
	
	public AgentAccountDto selectAccount(String email);
	
}
