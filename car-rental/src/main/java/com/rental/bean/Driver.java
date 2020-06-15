package com.rental.bean;

public class Driver {
	
	private String username;
	
	private String bdriver;
	
	private String rdriver;
	
	private String flag;
	
	

	public Driver() {
		super();
	}

	public Driver(String username, String bdriver, String rdriver, String flag) {
		super();
		this.username = username;
		this.bdriver = bdriver;
		this.rdriver = rdriver;
		this.flag = flag;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getBdriver() {
		return bdriver;
	}

	public void setBdriver(String bdriver) {
		this.bdriver = bdriver;
	}

	public String getRdriver() {
		return rdriver;
	}

	public void setRdriver(String rdriver) {
		this.rdriver = rdriver;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
	

}
