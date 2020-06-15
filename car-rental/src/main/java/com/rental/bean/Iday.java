package com.rental.bean;

public class Iday {
	private int cid;
	
	private String username;
	
	private String starttime;
	
	private String endtime;

	
	public Iday() {
		super();
	}


	public Iday(int cid, String username, String starttime, String endtime) {
		super();
		this.cid = cid;
		this.username = username;
		this.starttime = starttime;
		this.endtime = endtime;
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


	@Override
	public String toString() {
		return "Iday [cid=" + cid + ", username=" + username + ", starttime=" + starttime + ", endtime=" + endtime
				+ "]";
	}

	
	


	
	
}
