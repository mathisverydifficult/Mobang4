package com.finalproject.mobang.user.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.user.dao.ReviewDao;
import com.finalproject.mobang.user.dto.Criteria;
import com.finalproject.mobang.user.dto.ReviewDto;
@Service
public class ReviewBizImpl implements ReviewBiz {

	@Autowired
	ReviewDao dao;
	
	@Override
	public List<ReviewDto> selectListReview(Criteria cri) {
		return dao.selectListReview(cri);
	}

	@Override
	public List<ReviewDto> selectListAgReview(Criteria cri) {
		return dao.selectListAgReview(cri);
	}

	@Override
	public int insert(ReviewDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int delete(ReviewDto dto) {
		return dao.delete(dto);
	}

	@Override
	public int listCountUser(String email) {
		return dao.listCountUser(email);
	}

}
