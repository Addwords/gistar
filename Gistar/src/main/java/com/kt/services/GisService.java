package com.kt.services;

import java.util.Map;

import com.kt.vo.GisVO;
import com.kt.vo.SangVO;
import com.kt.vo.guVO;

public interface GisService {

	
	//클릭영역 주소값 return
	Map<String, Object> selectList(GisVO gisVO);
	
	//선택된 상권 정보 List
	Map<String, Object> getSangList(SangVO sangVO);

	//선택된 상권 정보 List
	Map<String, Object> getSangCluster(SangVO sangVO);
	
	//서울시 구 정보 List
	Map<String, Object> getSeoulList();

	//서울시 경계영역 
	Map<String, Object> getSeoulGeom(guVO guVO);

	//서울시 읍면동 경계영역
	Map<String, Object> getEmdGeom(guVO guVO);

	
}
