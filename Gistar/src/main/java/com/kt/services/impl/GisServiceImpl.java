package com.kt.services.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kt.mapper.GisMapper;
import com.kt.services.GisService;
import com.kt.vo.GisVO;
import com.kt.vo.SangVO;
import com.kt.vo.guVO;

@Service(value="com.kt.service.impl.GisServiceImpl")
public class GisServiceImpl implements GisService{

	protected Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GisMapper gisMapper;
	
	
	//게시글 list
	@Override
	public Map<String, Object> selectList() {
		
		log.info("selectPostList : {}", gisMapper.toString());
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		
		//int listcnt = gisMapper.selectList();
		
		List<GisVO> resultlist = gisMapper.selectList();
		
		//resultMap.put("listcnt", listcnt);
		resultMap.put("resultlist", resultlist);
		
		return resultMap;
	}

	//상권정보 가져오기
	@Override
	public Map<String, Object> getSangList(SangVO sangVO) {
		log.info("getSangList : {}", gisMapper.toString());
		
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<SangVO> resultlist = gisMapper.getSangList(sangVO);
		resultMap.put("resultlist", resultlist);
		
		return resultMap;
	}

	//서울시군구 정보 가져오기
	@Override
	public Map<String, Object> getSeoulList() {
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<SangVO> resultlist = gisMapper.getSeoulList();
		//System.out.println(resultlist.toString());
		resultMap.put("resultlist", resultlist);
		return resultMap;
	}

	//서울시군구 경계정보 가져오기
	@Override
	public Map<String, Object> getSeoulGeom() {
		Map<String,Object> resultMap = new HashMap<String, Object>();
		List<guVO> resultlist = gisMapper.getSeoulGeom();
		//System.out.println(resultlist.toString());
		resultMap.put("resultlist", resultlist);
		return resultMap;
	}
	
	
}
