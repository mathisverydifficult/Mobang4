package com.finalproject.mobang.common.utils;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;


public class FileListMaker {
	
	public static List<String> fileListMaker(String st) {
		List<String> list = new ArrayList<String>();
		String[] array = st.split("/_/");
		for(int i=0; i<array.length;i++) {
			list.add(array[i]);
		}
		
		
		
		return list;
	}
	
	public static void main(String[] args) {
		String happy ="tlqk//tlqk//alcnls//";
		String[] array =happy.split("//");
		System.out.println(array);
		System.out.println(array.length);
		for(int i=0; i<array.length;i++) {
			System.out.println(array[i]);
		}
		List<String> list = new ArrayList<String>();
		list = fileListMaker("tlqk/_/tlqk//alcnls/_/dfdwf//더해봐");
		for( int i=0; i<list.size();i++) {
			System.out.println(list.get(i));
		}
	}
}
