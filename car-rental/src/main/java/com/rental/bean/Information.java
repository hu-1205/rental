package com.rental.bean;

public class Information {
	
	private String username;

    private String password;
    
    private String flag;
    
    

	public Information() {
		super();
	}

	public Information(String username, String password, String flag) {
		super();
		this.username = username;
		this.password = password;
		this.flag = flag;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
    
    
}
