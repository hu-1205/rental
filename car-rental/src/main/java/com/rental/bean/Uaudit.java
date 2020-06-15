package com.rental.bean;

public class Uaudit {
	
	private int uid;
	
	private String username;
	
	private int cid;
	
	private String cname;
	
	private String starttime;
	
	private String endtime;
	
	private int day;
	
	private int dmoney;
	
	
	

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public Uaudit(int uid, String username, int cid, String cname, String starttime, String endtime, int day,
			int dmoney) {
		super();
		this.uid = uid;
		this.username = username;
		this.cid = cid;
		this.cname = cname;
		this.starttime = starttime;
		this.endtime = endtime;
		this.day = day;
		this.dmoney = dmoney;
	}

	public Uaudit(String username, int cid, String cname, String starttime, String endtime, int day, int dmoney) {
		super();
		this.username = username;
		this.cid = cid;
		this.cname = cname;
		this.starttime = starttime;
		this.endtime = endtime;
		this.day = day;
		this.dmoney = dmoney;
	}

	public Uaudit(String username, int cid,  String starttime, String endtime, int day, int dmoney) {
		super();
		this.cid = cid;
		this.username = username;
		this.starttime = starttime;
		this.endtime = endtime;
		this.day = day;
		this.dmoney = dmoney;
	}

	public Uaudit() {
		super();
	}

	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public int getDmoney() {
		return dmoney;
	}

	public void setDmoney(int dmoney) {
		this.dmoney = dmoney;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}
	
	
	
	
	
}
