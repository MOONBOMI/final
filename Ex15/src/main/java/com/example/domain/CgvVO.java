package com.example.domain;

import java.util.Date;

public class CgvVO {

	private String cdate;
	private int rank;
	private String title;
	private String image;
	
	
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	
	
	@Override
	public String toString() {
		return "CgvVO [cdate=" + cdate + ", rank=" + rank + ", title=" + title + ", image=" + image + "]";
	}
	
	
}
