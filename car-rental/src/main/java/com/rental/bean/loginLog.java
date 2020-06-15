package com.rental.bean;

public class loginLog {
	
	private String username;
	
	private String logtime;

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getLogtime() {
		return logtime;
	}

	public void setLogtime(String logtime) {
		this.logtime = logtime;
	}

	public loginLog(String username, String logtime) {
		super();
		this.username = username;
		this.logtime = logtime;
	}

	public loginLog() {
		super();
	}
	
	

}
