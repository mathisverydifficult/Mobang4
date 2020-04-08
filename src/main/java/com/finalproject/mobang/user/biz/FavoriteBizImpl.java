package com.finalproject.mobang.user.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.admin.dao.QnaBoardDao;
import com.finalproject.mobang.user.dao.FavoriteDao;
import com.finalproject.mobang.user.dto.FavoriteDto;

@Service
public class FavoriteBizImpl implements FavoriteBiz {

	@Autowired
	private FavoriteDao dao;
	
	@Override
	public int insertRecent(FavoriteDto dto) {
		return dao.insertRecent(dto);
	}

	@Override
	public int insertDibs(FavoriteDto dto) {
		return dao.insertDibs(dto);
	}

	@Override
	public int deleteDibs(FavoriteDto dto) {
		return dao.deleteDibs(dto);
	}

	@Override
	public int updateRoomEx(FavoriteDto dto) {
		return dao.updateRoomEx(dto);
	}

	@Override
	public List<FavoriteDto> selectListDibs(String email) {
		return dao.selectListDibs(email);
	}

	@Override
	public List<FavoriteDto> selectListRecent(String email) {
		return dao.selectListRecent(email);
	}

	@Override
	public int dibsCount(String email) {
		return dao.dibsCount(email);
	}

	@Override
	public int recentCount(String email) {
		return dao.recentCount(email);
	}

}