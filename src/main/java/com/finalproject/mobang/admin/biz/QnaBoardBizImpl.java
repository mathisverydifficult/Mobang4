package com.finalproject.mobang.admin.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.admin.dao.QnaBoardDao;
import com.finalproject.mobang.admin.dto.QnaBoardDto;
@Service
public class QnaBoardBizImpl implements QnaBoardBiz {

	@Autowired
	private QnaBoardDao dao;
	
	
	@Override
	public List<QnaBoardDto> selectList() {
		return dao.selectList();
	}
	
	@Override
	public int listCount() {
		return dao.listCount();
	};

	@Override
	public QnaBoardDto selectOne(int seqQ) {
		return dao.selectOne(seqQ);
	}


	@Override
	public int insert(QnaBoardDto dto) {
		return dao.insert(dto);
	}


	@Override
	public int update(QnaBoardDto dto) {
		return dao.update(dto);
	}


	@Override
	public int delete(int seqQ) {
		return dao.delete(seqQ);
	}


	

}
