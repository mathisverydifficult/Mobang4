package com.finalproject.mobang.login.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.login.dto.LoginDto;

@Repository
public class LoginDaoImpl implements LoginDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int userInsert(LoginDto dto) {
		int res = 0;
		
		
		try {
			res = sqlSession.insert(NAMESPACE+"userinsert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : insert user");
			e.printStackTrace();
		}
		
		System.out.println("dao : " + res);
		
		return res;
	}

	@Override
	public int agentInsert(LoginDto dto) {
		int res = 0;
		
		System.out.println(dto.getEmail() + "  " + dto.getName() + "  " + dto.getPwd() + "  " + dto.getPhone());
		try {
			res = sqlSession.insert(NAMESPACE+"agentinsert", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : agent user");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public LoginDto selectUser(String email) {
		
		LoginDto dto = new LoginDto();
		
		
		try {
			dto = sqlSession.selectOne(NAMESPACE+"selectuser", email);
			System.out.println("dao" + dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : selectUser");
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public int userUpdate(LoginDto dto) {
		int res = 0;
	
		System.out.println("userupdatedao : "+dto);
		
		try {
			res = sqlSession.insert(NAMESPACE+"userupdate", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : user update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int agentUpdate(LoginDto dto) {
		int res = 0;
		
		System.out.println(dto.getEmail() + "  " + dto.getName() + "  " + dto.getPwd() + "  " + dto.getPhone());
		try {
			res = sqlSession.insert(NAMESPACE+"agentupdate", dto);
		} catch (Exception e) {
			System.out.println("[ERROR] : agent update");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int updatePwd(String email) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE+"updatepwd", email);
		} catch (Exception e) {
			System.out.println("[ERROR] : update pwd");
			e.printStackTrace();
		}
		
		return res;
	}

}
