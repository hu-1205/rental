package com.rental.bean;

public class sUser {
    private String username;

    private String password;
    
    private int money;
    
    private int deposit;
    
    
    			
    


	

	public sUser(String username, String password, int money, int deposit) {
		super();
		this.username = username;
		this.password = password;
		this.money = money;
		this.deposit = deposit;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getDeposit() {
		return deposit;
	}

	public void setDeposit(int deposit) {
		this.deposit = deposit;
	}

	public sUser() {
		super();
	}

	public sUser(String username, String password) {
		super();
		this.username = username;
		this.password = password;
	}

	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

	@Override
	public String toString() {
		return "sUser [username=" + username + ", password=" + password + ", money=" + money + ", deposit=" + deposit
				+ "]";
	}


    
    
}