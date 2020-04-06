package com.finalproject.mobang.common.biz;

import java.util.List;

import com.finalproject.mobang.common.dto.UploadFile;

public interface FileBiz {

	
	
	
	public int insert(UploadFile uploadFile);
	
	// 데이터가 db에 저장되는 것과 동시에 보여주려고 하는 것 때문에 이렇게 변수를 받음
	// 글에 포함되어 있는 값을 가져오는 것은 글번호로 불러오면 될듯.
	public UploadFile selectone(String name);
	
	public List<UploadFile> selectList(String src);
	
}
