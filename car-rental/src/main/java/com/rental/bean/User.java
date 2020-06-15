package com.rental.bean;

public class User {
    private Integer id;

    private String username;

    private String password;

    private String phone;

    private Integer gender;

    private Integer age;
    
    

    @Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", phone=" + phone + ", gender="
				+ gender + ", age=" + age + "]";
	}

	public User() {
		super();
	}

	public User( String username, String password, String phone, Integer gender, Integer age) {
		super();
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.gender = gender;
		this.age = age;
	}
	
	

	public User(Integer id, String username, String password, String phone, Integer gender, Integer age) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.phone = phone;
		this.gender = gender;
		this.age = age;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
}