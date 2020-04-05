package com.finalproject.mobang.agent.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.agent.dao.AgentMypageDao;
import com.finalproject.mobang.agent.dto.AgentAccountDto;
import com.finalproject.mobang.agent.dto.AgentProductDto;

@Service
public class AgentMypageBizImpl implements AgentMypageBiz {
	
	@Autowired
	private AgentMypageDao dao;

	@Override
	public AgentAccountDto selectAccount(String email) {
		return dao.selectAccount(email);
	}

	@Override
	public  List<AgentProductDto> selectProductList(String email) {
		return dao.selectProductList(email);
	}

}
