package com.rental.bean;

public class UMoney {
    private String username;

    private Integer money;
    
    

    public UMoney() {
		super();
	}

	public UMoney(String username, Integer money) {
		super();
		this.username = username;
		this.money = money;
	}

	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public Integer getMoney() {
        return money;
    }

    public void setMoney(Integer money) {
        this.money = money;
    }
}