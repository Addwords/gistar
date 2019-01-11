package com.kt.mapper;

import java.util.List;

import com.kt.vo.GisVO;
import com.kt.vo.SangVO;
import com.kt.vo.guVO;

public interface GisMapper {
	
	//게시글 list
	List<GisVO> selectList();
	List<SangVO> getSangList(SangVO sangVO);
	List<SangVO> getSeoulList();
	//List<SangVO> getSangList();
	
}
