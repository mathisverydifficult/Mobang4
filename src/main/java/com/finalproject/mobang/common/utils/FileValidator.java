package com.finalproject.mobang.common.utils;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.finalproject.mobang.common.dto.UploadFile;



@Service
public class FileValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		// validator 사용 가능 여부 확인
		return false;
	}

	@Override
	public void validate(Object target, Errors errors) {
		UploadFile file = (UploadFile) target;
		
		if(file.getMpfile().getSize()==0) { // 파일 선택 안하거나 잘못된 파일
			errors.rejectValue("mpfile", "fileNPE", "Please select a file");
			// mpfile(field)에 대한 errorCode return, default message 전달
		}
	}
	
	
}


  
 
