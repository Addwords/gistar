package com.kt.vo;


public class GisVO {

	private double lon;       //클릭한 위치의 x값
	private double lat;		  //클릭한 위치의 y값
	private String emdCd;     //읍면동코드
	private String emdKorNm;  //읍면동명
	private String emdGeom;   //읍면동경계영역
	
	
	
	public double getLon() {
		return lon;
	}
	public void setLon(double lon) {
		this.lon = lon;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public String getEmdCd() {
		return emdCd;
	}
	public void setEmdCd(String emdCd) {
		this.emdCd = emdCd;
	}
	public String getEmdKorNm() {
		return emdKorNm;
	}
	public void setEmdKorNm(String emdKorNm) {
		this.emdKorNm = emdKorNm;
	}
	public String getEmdGeom() {
		return emdGeom;
	}
	public void setEmdGeom(String emdGeom) {
		this.emdGeom = emdGeom;
	}
	

	

	
}
