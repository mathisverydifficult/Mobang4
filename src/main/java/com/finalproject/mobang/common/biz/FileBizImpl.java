package com.finalproject.mobang.common.biz;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.finalproject.mobang.common.dao.FileDao;
import com.finalproject.mobang.common.dto.UploadFile;

@Service
public class FileBizImpl implements FileBiz {

	
	@Autowired
	private FileDao dao; 
	
	@Override
	public int insert(UploadFile uploadFile) {
		return dao.insert(uploadFile);
	}
	@Override
	public UploadFile selectone(String name) {
		return dao.selectone(name);
	}
	@Override
	public List<UploadFile> selectList(String src) {
		return dao.selectList(src);
	}

}
