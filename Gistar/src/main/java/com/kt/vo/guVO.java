package com.kt.vo;


public class guVO {

	private String sigCd;          		//시군구코드 
	private String sigEngNm;          //시군구명 
	private String sigKorNm;          //시군구명 
	private String geom; 				//geometry
	private double xCrd; //위도
	private double yCrd; //경도
	
	public String getSigCd() {
		return sigCd;
	}
	public void setSigCd(String sigCd) {
		this.sigCd = sigCd;
	}
	public String getSigEngNm() {
		return sigEngNm;
	}
	public void setSigEngNm(String sigEngNm) {
		this.sigEngNm = sigEngNm;
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
