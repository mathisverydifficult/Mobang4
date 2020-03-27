package com.finalproject.mobang.admin.biz;

import java.util.List;

import com.finalproject.mobang.admin.dto.QnaBoardDto;

public interface QnaBoardBiz {
	public List<QnaBoardDto> selectList();
	public int listCount();
	public QnaBoardDto selectOne(int seqQ);
	public int insert(QnaBoardDto dto);
	public int update(QnaBoardDto dto);
	public int delete(int seqQ);
	
}
