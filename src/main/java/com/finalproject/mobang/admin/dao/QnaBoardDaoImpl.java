package com.finalproject.mobang.admin.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalproject.mobang.admin.dto.QnaBoardDto;
import com.finalproject.mobang.common.dto.UploadFile;

@Repository
public class QnaBoardDaoImpl implements QnaBoardDao {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//전체글 리스트
	@Override
	public List<QnaBoardDto> selectList() {
		List<QnaBoardDto> list = new ArrayList<QnaBoardDto>();
		try {
			list = sqlSessionTemplate.selectList(NAMESPACE + "selectList");
		} catch (Exception e) {
			System.out.println("[error] Qna selectList");
			e.printStackTrace();
		}
		return list;
	}
	// 게시글 숫자 세주는
	@Override
	public int listCount() {
		List<QnaBoardDto> list = new ArrayList<QnaBoardDto>();
		int count = 0;
		try {
			list = sqlSessionTemplate.selectList(NAMESPACE + "selectList");
			count = list.size();
		} catch (Exception e) {
			System.out.println("[error] Qna selectList count");
			e.printStackTrace();
		}
		return count;
	}

	// 글 하나만 보기
	@Override
	public QnaBoardDto selectOne(int seqQ) {
		QnaBoardDto dto = null;
		
		try {
			dto = sqlSessionTemplate.selectOne(NAMESPACE+"selectOne",seqQ);
		} catch (Exception e) {
			System.out.println("[error] : Qna  selectOne");
			e.printStackTrace();
		}
		
		return dto;
	}

	// 글 작성
	@Override
	public int insert(QnaBoardDto dto) {
		int res=0;
		try {
			res = sqlSessionTemplate.insert(NAMESPACE+"insert",dto);
			
			
		} catch (Exception e) {
			System.out.println("[error] : insert ");
			e.printStackTrace();
		}
		
		return res;
	}

	// 글 수정
	@Override
	public int update(QnaBoardDto dto) {
		int res =0;
		
		try {
			res = sqlSessionTemplate.update(NAMESPACE+"update",dto);
		} catch (Exception e) {
			System.out.println("[error] : update");
			e.printStackTrace();
		}
		
		return res;
	}

	// 글 삭제
	@Override
	public int delete(int seqQ) {
		int res =0;
		
		try {
			res = sqlSessionTemplate.delete(NAMESPACE+"delete",seqQ);
		} catch (Exception e) {
			System.out.println("[error] : delete");
			e.printStackTrace();
		}
		return res;
	}
	
	


	


	

}
