package com.kt.controller;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kt.services.GisService;
import com.kt.vo.GisVO;
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
	public @ResponseBody Map<String, Object> selectList(@RequestBody GisVO gisVO){
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		try {
			map.put("errorYn", "N");
			map.put("result", gisService.selectList(gisVO));
			
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
				//map.put("result", "테스트");
				
			}catch(Exception e) {
				e.printStackTrace();
				log.debug("{}",e.getMessage());
				map.put("errorYn", "Y");
				map.put("result", "ERROR");
			}
			
			return map;
		}

		//상권정보 가져오기
		@RequestMapping(value="/di/getSangCluster.gistar", method = RequestMethod.POST)
		//JSON으로 받을때 @RequestBody설정을 해준다. VO와 매핑되어야한다.
		public @ResponseBody Map<String, Object> getSangCluster(@RequestBody SangVO sangVO){
			Map<String, Object> map = new HashMap<String, Object>();
			
			try {
				map.put("errorYn", "N");
				//System.out.println("컨트롤"+sangVO);
				map.put("result", gisService.getSangCluster(sangVO));
				//map.put("result", "테스트");
				
			}catch(Exception e) {
				e.printStackTrace();
				log.debug("{}",e.getMessage());
				map.put("errorYn", "Y");
				map.put("result", "ERROR");
			}
			
			return map;
		}
		
		
		//서울시 구 코드랑 명 가져오기
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
		
		//서울시 시군구 경계영역정보 가져오기
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
		
		//서울시 읍면동 경계영역정보 가져오기
		@RequestMapping(value="/di/getEmdGeom.gistar", method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> getEmdGeom(@RequestBody guVO guVO){
			Map<String, Object> map = new HashMap<String, Object>();	
			try {
				map.put("errorYn", "N");
				map.put("result", gisService.getEmdGeom(guVO));
				
			}catch(Exception e) {
				e.printStackTrace();
				log.debug("{}",e.getMessage());
				map.put("errorYn", "Y");
				map.put("result", "ERROR");
			}
			
			return map;
		}

		//csv파일 체크해보기
	/*
	 * @RequestMapping(value="/di/csv.gistar", method = RequestMethod.POST)
	 * public @ResponseBody Map<String, Object> csvValidation(){ //@RequestBody
	 * MultipartRequest mr //System.out.println(mr.getFileNames());
	 * //System.out.println("왔다"); Map<String, Object> map = new HashMap<String,
	 * Object>(); String csvFile = "D:/sangtest.csv"; BufferedReader br = null;
	 * String line = ""; String cvsSplitBy = ",";
	 * 
	 * try { String[] country = null; br = new BufferedReader(new
	 * FileReader(csvFile)); Pattern p = Pattern.compile("(^[0-9]*$)"); //숫자로만 이루어진
	 * 데이터 검사 Pattern jubun = Pattern.compile(
	 * "^\\d{2}(0[1-9]|1[0-2])(0[1-9]|[12][0-9]|[3][01])\\-[1-4][0-9]{6}$");
	 * //주민등록번호 패턴 int cnt=0; int vali; while ((line = br.readLine()) != null) {
	 * 
	 * country = line.split(cvsSplitBy);//한 row를 ,로 구분하여 배열에 담음
	 * 
	 * for(int i=0;i<country.length;i++ ) { //담겨있는 배열의 길이만큼 꺼냄
	 * //System.out.println(country[i]);
	 * 
	 * Matcher m = p.matcher(country[i]); Matcher m2 = jubun.matcher(country[i]);
	 * if(m2.find()) { log.info("r:{} {}",i,country[i]); //주민등록번호 데이터만 로그로 남김 cnt++;
	 * }else {
	 * 
	 * } } } System.out.println("count : "+cnt); log.info("count:{}",cnt); } catch
	 * (FileNotFoundException e) { e.printStackTrace(); } catch (IOException e) {
	 * e.printStackTrace(); } finally { if (br != null) { try { br.close(); } catch
	 * (IOException e) { e.printStackTrace(); } } }
	 */

			
			//return map;
		//}
		
		
		

		
}
