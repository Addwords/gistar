package com.kt.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.services.GisService;
import com.kt.vo.SangVO;
import com.kt.vo.guVO;

@Controller(value="com.kt.controller.GisController")
public class GisController {

	//log
	protected Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GisService gisService;
	
	//뿌리기
	@RequestMapping(value="/di/selectList.gistar", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> selectList(){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("errorYn", "N");
			map.put("result", gisService.selectList());
			
		}catch(Exception e) {
			e.printStackTrace();
			log.debug("{}",e.getMessage());
			map.put("errorYn", "Y");
			map.put("result", "ERROR");
		}
		
		return map;
	}
	
		//상권정보 가져오기
		@RequestMapping(value="/di/getSangList.gistar", method = RequestMethod.POST)
															//JSON으로 받을때 @RequestBody설정을 해준다. VO와 매핑되어야한다.
		public @ResponseBody Map<String, Object> getSangList(@RequestBody SangVO sangVO){
			Map<String, Object> map = new HashMap<String, Object>();
			
			try {
				map.put("errorYn", "N");
				//System.out.println("컨트롤"+sangVO);
				map.put("result", gisService.getSangList(sangVO));
				
			}catch(Exception e) {
				e.printStackTrace();
				log.debug("{}",e.getMessage());
				map.put("errorYn", "Y");
				map.put("result", "ERROR");
			}
			
			return map;
		}
		
		
		//서울시 구 정보 가져오기
		@RequestMapping(value="/di/getSeoulList.gistar", method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> getSeoulList(){
			
			Map<String, Object> map = new HashMap<String, Object>();
			
			try {
				map.put("errorYn", "N");
				map.put("result", gisService.getSeoulList());
				
			}catch(Exception e) {
				e.printStackTrace();
				log.debug("{}",e.getMessage());
				map.put("errorYn", "Y");
				map.put("result", "ERROR");
			}
			
			return map;
		}
		
		//서울시 종로구 정보 가져오기
				@RequestMapping(value="/di/getSeoulGeom.gistar", method = RequestMethod.POST)
				public @ResponseBody Map<String, Object> getSeoulGeom(@RequestBody guVO guVO){
					Map<String, Object> map = new HashMap<String, Object>();
					
					try {
						map.put("errorYn", "N");
						map.put("result", gisService.getSeoulGeom(guVO));
						
					}catch(Exception e) {
						e.printStackTrace();
						log.debug("{}",e.getMessage());
						map.put("errorYn", "Y");
						map.put("result", "ERROR");
					}
					
					return map;
				}
}
