package com.finalproject.mobang.user.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.user.dao.roomsearchDao;
import com.finalproject.mobang.user.dto.roomsearchDto;



@Service
public class roomsearchBizImpl implements roomsearchBiz {

	@Autowired
	private roomsearchDao dao;
	
	@Override
	public List<roomsearchDto> dibList() {
		return dao.dibList();
	}
	
	@Override
	public List<roomsearchDto> selectsearchList(String keyword) {
		return dao.selectsearchList(keyword);
	}

	@Override
	public roomsearchDto selectOne(int myno) {
		return dao.selectOne(myno);
	}

	@Override
	public int insert(roomsearchDto dto) {
		return dao.insert(dto);
	}

	@Override
	public int update(roomsearchDto dto) {
		return dao.update(dto);
	}

	@Override
	public int delete(int myno) {
		return dao.delete(myno);
	}

}
