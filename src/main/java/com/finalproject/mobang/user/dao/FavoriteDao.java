package com.finalproject.mobang.user.dao;

import java.util.List;

import com.finalproject.mobang.user.dto.FavoriteDto;

public interface FavoriteDao {
	
	String NAMESPACE = 	"favorite.";
	// 유저가 본 방을 db에 추가하는 함수
	public int insertRecent(FavoriteDto dto);
	// 유저가 찜을 하면 DB에 추가하는 함수
	public int insertDibs(FavoriteDto dto);
	// 찜한 방을 제거하는 함수
	public int deleteDibs(FavoriteDto dto);
	// 올린 방이 삭제되면 상태를 변경! 추천에서 제거하기 위해 방의 존재여부를 알려준다
	public int updateRoomEx(FavoriteDto dto);
	// 찜한 방의 리스트를 출력하는 함수
	public List<FavoriteDto> selectListDibs(String email);
	// 본 방의 리스트(30개)를 출력하는 함수
	public List<FavoriteDto> selectListRecent(String email);
	// 찜한 방의 수를 출력하는 함수
	public int dibsCount(String email);
	// 본 방의 수를 출력하는 함수
	public int recentCount(String email);
	
	
}
