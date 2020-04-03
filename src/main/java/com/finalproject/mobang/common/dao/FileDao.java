package com.finalproject.mobang.common.dao;


import java.util.List;

import com.finalproject.mobang.common.dto.UploadFile;

public interface FileDao {

	
	String NAMESPACE = "fileupload.";
	
	public int insert(UploadFile uploadFile);
	
	public UploadFile selectone(String name);
	
	public List<UploadFile> selectList(String src);
}
