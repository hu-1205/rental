package com.rental.bean;

public class Deposit {
	
	private int did;
	
	private String username;
	
	private int money;
	
	private int flag;
	
	

	public Deposit(int did, String username, int money, int flag) {
		super();
		this.did = did;
		this.username = username;
		this.money = money;
		this.flag = flag;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	public Deposit(String username, int money, int flag) {
		super();
		this.username = username;
		this.money = money;
		this.flag = flag;
	}

	public Deposit() {
		super();
	}

	@Override
	public String toString() {
		return "Deposit [username=" + username + ", money=" + money + ", flag=" + flag + "]";
	}
	
	
	
	
}
