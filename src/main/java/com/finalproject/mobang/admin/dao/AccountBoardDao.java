package com.finalproject.mobang.admin.dao;

import java.util.List;

import com.finalproject.mobang.admin.dto.AccountBoardDto;

public interface AccountBoardDao {

	

	String NAMESPACE = 	"accountboard.";
	
	public List<AccountBoardDto> selectList();
}
