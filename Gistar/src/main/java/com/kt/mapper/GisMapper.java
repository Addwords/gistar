package com.kt.mapper;

import java.util.List;

import com.kt.vo.GisVO;

public interface GisMapper {
	
	//게시글 list
	List<GisVO> selectList();
	
}
