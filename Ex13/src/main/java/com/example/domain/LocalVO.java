package com.example.domain;

public class LocalVO {

	private int id;
	private String place_name;
	private String phone;
	private String address_name;
	private double x;
	private double y;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlace_name() {
		return place_name;
	}
	public void setPlace_name(String place_name) {
		this.place_name = place_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress_name() {
		return address_name;
	}
	public void setAddress_name(String address_name) {
		this.address_name = address_name;
	}
	public double getX() {
		return x;
	}
	public void setX(double x) {
		this.x = x;
	}
	public double getY() {
		return y;
	}
	public void setY(double y) {
		this.y = y;
	}
	
	
	@Override
	public String toString() {
		return "LocalVO [id=" + id + ", place_name=" + place_name + ", phone=" + phone + ", address_name="
				+ address_name + ", x=" + x + ", y=" + y + "]";
	}
	
	
}
