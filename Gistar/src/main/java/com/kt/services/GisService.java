package com.kt.services;

import java.util.Map;

import com.kt.vo.GisVO;

public interface GisService {

	
	//전체 게시글 List
	Map<String, Object> selectList();
	Map<String, Object> getSangList();
	
}
