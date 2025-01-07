package com.mySpring.myapp.pages.vo;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component("ReserveVO")
public class ReserveVO {
	private int rsvnum;                // 예약번호
	private String name;             // 시설명
	private String address;			//주소
	private Date ptime;             // 주차 시간
	private Date etime;        // 출차 시간
	private String carnum;            // 예약 차량번호
	private int phone;              // 예약 전화번호
	private int fee;          // 요금
	private int mileage;        //마일리지


	public ReserveVO() {
	}

	public ReserveVO(int rsvnum, String name, String address, Date ptime, Date etime, String carnum, int phone, int fee, int mileage) {
	    this.rsvnum = rsvnum;
	    this.name = name;
	    this.address = address;
	    this.ptime = ptime;
	    this.etime = etime;
	    this.carnum = carnum;
	    this.address = address;
	    this.phone = phone;
	    this.fee = fee;
	    this.mileage = mileage;
	}

	// Getter 및 Setter 메서드
	public int getRsvname() {
	    return rsvnum;
	}

	public void setRsvname(int rsvnum) {
	    this.rsvnum = rsvnum;
	}

	public String getName() {
	    return name;
	}

	public void setName(String name) {
	    this.name = name;
	}

	public Date getPtime() {
	    return ptime;
	}

	public void setPtime(Date ptime) {
	    this.ptime = ptime;
	}


	public Date getEtime() {
	    return etime;
	}

	public void setEtime(Date etime) {
	    this.etime = etime;
	}

	public String getCarnum() {
		return carnum;
	}
	public void setCarnum(String carnum) {
		this.carnum = carnum;
	}

	public int getPhone() {
		return phone;
	}

	public void setPhone(int phone) {
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

}
