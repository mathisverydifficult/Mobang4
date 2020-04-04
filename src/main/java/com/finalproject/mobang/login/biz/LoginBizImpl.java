package com.finalproject.mobang.login.biz;

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
}

