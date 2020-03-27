package com.finalproject.mobang.admin.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.admin.dao.AccountBoardDao;
import com.finalproject.mobang.admin.dto.AccountBoardDto;

@Service
public class AccountBoardBizImpl implements AccountBoardBiz {

	@Autowired
	private AccountBoardDao dao;
	
	
	
	@Override
	public List<AccountBoardDto> selectList() {
		return dao.selectList();
	}
	

}
