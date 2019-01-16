package com.kt.vo;


public class EmdVO {

	private String emdCd;          	  //읍면동코드 
	private String sigKorNm;          //읍면동명 
	private String geom; 			  //geometry
	private double xCrd;              //위도
	private double yCrd;              //경도
	
	public String getEmdCd() {
		return emdCd;
	}
	public void setEmdCd(String emdCd) {
		this.emdCd = emdCd;
	}
	public String getSigKorNm() {
		return sigKorNm;
	}
	public void setSigKorNm(String sigKorNm) {
		this.sigKorNm = sigKorNm;
	}
	public String getGeom() {
		return geom;
	}
	public void setGeom(String geom) {
		this.geom = geom;
	}
	public double getxCrd() {
		return xCrd;
	}
	public void setxCrd(double xCrd) {
		this.xCrd = xCrd;
	}
	public double getyCrd() {
		return yCrd;
	}
	public void setyCrd(double yCrd) {
		this.yCrd = yCrd;
	}
	
	
}
