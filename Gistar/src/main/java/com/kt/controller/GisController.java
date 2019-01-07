package com.kt.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.services.GisService;

@Controller(value="com.kt.controller.GisController")
public class GisController {

	//log
	protected Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GisService gisService;
	
	//게시글 건수와 게시글 뿌리기
	@RequestMapping(value="/di/selectList.gistar", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> selectPostList(){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("errorYn", "N");
			map.put("result", gisService.selectList());
			
		}catch(Exception e) {
			log.debug("{}",e.getMessage());
			map.put("errorYn", "Y");
			map.put("result", "ERROR");
		}
		
		return map;
	}
}
