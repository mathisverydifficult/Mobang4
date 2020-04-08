package com.finalproject.mobang.agent.biz;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.agent.dao.AgentPayDao;
import com.finalproject.mobang.agent.dto.AgentAccountDto;


@Service
public class AgentPayBizImpl implements AgentPayBiz {
	
	@Autowired
	private AgentPayDao dao;

	@Override
	public AgentAccountDto selectAccount(String email) {
		return dao.selectAccount(email);
	}
}
