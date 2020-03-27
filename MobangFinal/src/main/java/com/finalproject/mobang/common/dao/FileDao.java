package com.finalproject.mobang.common.dao;


import com.finalproject.mobang.common.dto.UploadFile;

public interface FileDao {

	
	String NAMESPACE = "fileupload.";
	
	public int insert(UploadFile uploadFile);
	
	public UploadFile selectone(String name);
}
