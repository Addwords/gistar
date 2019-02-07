package com.kt.vo;


public class EmdVO {

	private String emdCd;          	  //읍면동코드 
	private String emdKorNm;          //읍면동명 
	private String emdGeom; 		  //읍면동geometry
	private String guGeom; 			  //시군구geometry
	private int rank;			      //분위
	private double traCnt;			  //상권수
	private double xCrd;              //위도
	private double yCrd;              //경도
	
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
	public String getGuGeom() {
		return guGeom;
	}
	public void setGuGeom(String guGeom) {
		this.guGeom = guGeom;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
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
	public double getTraCnt() {
		return traCnt;
	}
	public void setTraCnt(double traCnt) {
		this.traCnt = traCnt;
	}
	
	
}
