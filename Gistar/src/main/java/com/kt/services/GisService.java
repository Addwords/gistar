package com.kt.services;

import java.util.Map;

import com.kt.vo.SangVO;

public interface GisService {

	
	//전체 게시글 List
	Map<String, Object> selectList();
	
	//선택된 상권 정보 List
	Map<String, Object> getSangList(SangVO sangVO);
	
	//서울시 구 정보 List
	Map<String, Object> getSeoulList();

	//Map<String, Object> getSangList(SangVO sangVO);
	
}
