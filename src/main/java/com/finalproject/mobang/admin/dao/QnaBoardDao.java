package com.finalproject.mobang.admin.dao;

import java.util.List;

import com.finalproject.mobang.admin.dto.QnaBoardDto;
import com.finalproject.mobang.admin.dto.UploadFile;

public interface QnaBoardDao {

	

	String NAMESPACE = 	"qnaboard.";
	
	public List<QnaBoardDto> selectList();
	public int listCount();
	
//	public int insertFile(UploadFile uploadfile);
	public QnaBoardDto selectOne(int seqQ);
	public int insert(QnaBoardDto dto);
	public int update(QnaBoardDto dto);
	public int delete(int seqQ);
	
}
