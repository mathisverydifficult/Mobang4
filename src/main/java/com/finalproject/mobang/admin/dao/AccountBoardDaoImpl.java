package com.finalproject.mobang.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.admin.dto.AccountBoardDto;

@Repository
public class AccountBoardDaoImpl implements AccountBoardDao {

	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<AccountBoardDto> selectList() {
		List<AccountBoardDto> list = new ArrayList<AccountBoardDto>();
		try {
			list = sqlSessionTemplate.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("[error] Account selectList");
			e.printStackTrace();
		}
		return list;
	}
}
