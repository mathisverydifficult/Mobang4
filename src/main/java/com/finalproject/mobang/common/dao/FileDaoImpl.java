package com.finalproject.mobang.common.dao;


import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.common.dto.UploadFile;

@Repository
public class FileDaoImpl implements FileDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	// db에 넘겨주는 역할
	@Override
	public int insert(UploadFile uploadFile) {
		int res=0;
		
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"insert",uploadFile);
		} catch (Exception e) {
			System.out.println("error : insert file");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public UploadFile selectone(String name) {
		
		UploadFile dto = null;
		
		try {
			dto = sqlSessionTemplate.selectOne(NAMESPACE+"selectone",name);
		} catch (Exception e) {
			System.out.println("error : selectone file");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public List<UploadFile> selectList(String src) {
		
		List<UploadFile> list = new ArrayList<UploadFile>();
		
		try {
			list = sqlSessionTemplate.selectList(NAMESPACE+"selectList",src);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

}
