package com.mySpring.myapp.pages.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("reserveVO")
public class ReserveVO {
	private int rsvnum;                // 예약번호
	private String name;             // 시설명
	private String address;			//주소
	private String ptime;             // 주차 시간
	private String etime;        // 출차 시간
	private String carnum;            // 예약 차량번호
	private String phone;              // 예약 전화번호
	private int fee;          // 요금
	private int mileage;        //마일리지
	private String email;
	private int userid;

	public ReserveVO() {
	}

	public ReserveVO(int rsvnum, String name, String address, String ptime, String etime, String carnum, String phone, int fee, int mileage, int userid) {
	    this.rsvnum = rsvnum;
	    this.name = name;
	    this.address = address;
	    this.ptime = ptime;
	    this.etime = etime;
	    this.carnum = carnum;
	    this.phone = phone;
	    this.fee = fee;
	    this.mileage = mileage;
	    this.userid = userid;
	}

	// Getter
	public int getRsvnum() {
	    return rsvnum;
	}

	public void setRsvnum(int rsvnum) {
	    this.rsvnum = rsvnum;
	}

	public String getName() {
	    return name;
	}

	public void setName(String name) {
	    this.name = name;
	}

	public String getPtime() {
	    return ptime;
	}

	public void setPtime(String ptime) {
	    this.ptime = ptime;
	}


	public String getEtime() {
	    return etime;
	}

	public void setEtime(String etime) {
	    this.etime = etime;
	}

	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public int getFee() {
		return fee;
	}

	public void setFee(int fee) {
		this.fee = fee;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddress() {
		return address;
	}
	
	public int getUID() {
		return userid;
	}

	public void setUID(int userid) {
		this.userid = userid;
	}

}
