package com.finalproject.mobang.user.biz;

import java.util.List;

import com.finalproject.mobang.user.dto.Criteria;
import com.finalproject.mobang.user.dto.ReviewDto;

public interface ReviewBiz {
	
	//<!-- 내가 작성했던 리뷰 리스트를 보는 기능 -->
		public List<ReviewDto> selectListReview(Criteria cri);
		//<!-- 공인중개사 별 작성된 리뷰 리스트를 불러오는 기능 (글자수 제한 걸어서 내용도 바로 출력)-->
		public List<ReviewDto> selectListAgReview(Criteria cri);
		// 게시물 유저가 적은 리뷰의 총 개수
		public int listCountUser(String email);
		//<!-- 내가 공인중개사에게 리뷰를 남기는 것(insert) -->
		public int insert(ReviewDto dto);
		//<!-- 리뷰 삭제하는 기능 -->
		public int delete(ReviewDto dto);
}
