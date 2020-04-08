package com.finalproject.mobang.login.biz;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.login.dao.LoginDao;
import com.finalproject.mobang.login.dto.LoginDto;

@Service
public class LoginBizImpl implements LoginBiz{

	@Autowired
	LoginDao dao;
	
	public int userInsert(LoginDto dto) {
		return dao.userInsert(dto);	
	}

	@Override
	public int agentInsert(LoginDto dto) {
		// TODO Auto-generated method stub
		return dao.agentInsert(dto);
	}

	@Override
	public LoginDto selectUser(String email) {
		// TODO Auto-generated method stub
		return dao.selectUser(email);
	}

	@Override
	public int userUpdate(LoginDto dto) {
		// TODO Auto-generated method stub
		return dao.userUpdate(dto);
	}

	@Override
	public int agentUpdate(LoginDto dto) {
		// TODO Auto-generated method stub
		System.out.println("biz"+dto);
		return dao.agentUpdate(dto);
	}

	@Override
	public int updatePwd(Map<String, String> map) {
		// TODO Auto-generated method stub
		return dao.updatePwd(map);
	}
}

