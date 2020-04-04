package com.finalproject.mobang.user.dao;

import java.util.List;

import com.finalproject.mobang.user.dto.FavoriteDto;



public interface favoriteDao {
	String NAMESPACE = "favorite.";
	
	public List<FavoriteDto> selectList();
	public FavoriteDto selectOne(int myno);
	public int insertDibs(FavoriteDto dto);
	public int insertRecent(FavoriteDto dto);
	public int update(FavoriteDto dto);
	public int delete(int myno);
}
