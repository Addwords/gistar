package com.kt.mapper;

import java.util.List;

import com.kt.vo.EmdVO;
import com.kt.vo.GisVO;
import com.kt.vo.SangVO;
import com.kt.vo.guVO;

public interface GisMapper {
	
	// 샘플
	List<GisVO> selectList(GisVO gisVO);
	
	//상권정보 가져오기(10건)
	List<SangVO> getSangList(SangVO sangVO);

	//상권정보 가져오기
	List<SangVO> getSangCluster(SangVO sangVO);
	
	//시군구 정보 가져오기(서울 - 25개 구)
	List<SangVO> getSeoulList();
	
	//시군구 경계영역 정보 가져오기(서울특별시)
	List<guVO> getSeoulGeom(guVO guVO);
	
	//읍면동 경계영역 정보 가져오기
	List<EmdVO> getEmdGeom(guVO guVO);
	
}
