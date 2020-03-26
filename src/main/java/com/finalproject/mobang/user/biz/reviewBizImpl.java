package com.finalproject.mobang.user.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.user.dao.reviewDao;
import com.finalproject.mobang.user.dto.reviewDto;



@Service
public class reviewBizImpl implements reviewBiz {

	@Autowired
	private reviewDao dao;
	
	@Override
	public List<reviewDto> selectList() {
		return dao.selectList();
	}

	@Override
	public reviewDto selectOne(int myno) {
		// TODO Auto-generated method stub
		return dao.selectOne(myno);
	}

	@Override
	public int insert(reviewDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(reviewDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int myno) {
		return dao.delete(myno);
	}

}
