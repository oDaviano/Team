package com.mySpring.myapp.member.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("memberVO")
public class MemberVO {
	private String email;
	private String pwd;
	private String name;
	private String phone;
	private String carnum;
	private int mileage;
	private int userid;
	public MemberVO() {
		
	}

	public MemberVO(String email, String pwd, String name, String phone, String carnum, int mileage, int userid ) {
		this.email = email;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.carnum = carnum;
		this.mileage = mileage;
	    this.userid = userid;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCarnum() {
		return carnum;
	}
	
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}
	
	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
		
	}
	public int getUID() {
		return userid;
	}

	public void setUID(int userid) {
		this.userid = userid;
	}
}
