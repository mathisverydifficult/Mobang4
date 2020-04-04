package com.finalproject.mobang.user.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.user.dao.favoriteDao;
import com.finalproject.mobang.user.dto.FavoriteDto;



@Service
public class favoriteBizImpl implements favoriteBiz {

	@Autowired
	private favoriteDao dao;
	
	@Override
	public List<FavoriteDto> selectList() {
		return dao.selectList();
	}


	@Override
	public FavoriteDto selectOne(int myno) {
		// TODO Auto-generated method stub
		return dao.selectOne(myno);
	}

	@Override
	public int insertDibs(FavoriteDto dto) {
		return dao.insertDibs(dto);
	}
	
	@Override
	public int insertRecent(FavoriteDto dto) {
		return dao.insertRecent(dto);
	}

	@Override
	public int update(FavoriteDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int myno) {
		return dao.delete(myno);
	}

}
