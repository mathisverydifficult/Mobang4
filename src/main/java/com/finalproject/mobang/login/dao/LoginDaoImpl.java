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
		
		System.out.println("뭐야" + 
		"이름 : " + dto.getName() + 
		" 이메일 : " + dto.getEmail() +
		" 비번 : " + dto.getPwd() + 
		" 폰번 : " + dto.getPhone() +
		" 권한 : " + dto.getAuthority() +
		" 파일 : " + dto.getUserfile() +
		" 확인 : " + dto.getConfirm() +
		" 청결 : " + dto.getClean() +
		" 생활 : " + dto.getLifestyle() +
		" 동물 : " + dto.getAnimal());
		
		try {
			System.out.println("???");
			res = sqlSession.insert(NAMESPACE+"userinsert", dto);
			System.out.println("돼??");
		} catch (Exception e) {
			System.out.println("[ERROR] : insert user");
			e.printStackTrace();
		}
		
		return res;
	}

}
