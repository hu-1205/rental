package com.rental.bean;

public class Account {
    private Integer aid;

    private String suser;

    private String cname;

    private Integer rday;

    private Integer consumption;

    private String date;
    
    private String etime;
    
    private String status;
    
    private String imgp;
    
    
    
    
    
    
    
    
    public Account(String suser, String cname, Integer rday, Integer consumption, String date,
			String etime, String status, String imgp) {
		super();
		this.suser = suser;
		this.cname = cname;
		this.rday = rday;
		this.consumption = consumption;
		this.date = date;
		this.etime = etime;
		this.status = status;
		this.imgp = imgp;
	}

	public Account(String suser, String cname, Integer rday, Integer consumption, String date,
			String etime, String status) {
		super();
		this.suser = suser;
		this.cname = cname;
		this.rday = rday;
		this.consumption = consumption;
		this.date = date;
		this.etime = etime;
		this.status = status;
	}
    
    public Account(String suser, String cname, Integer rday, Integer consumption, String date) {
		super();
		this.suser = suser;
		this.cname = cname;
		this.rday = rday;
		this.consumption = consumption;
		this.date = date;
	}
    
    


	public String getImgp() {
		return imgp;
	}

	public void setImgp(String imgp) {
		this.imgp = imgp;
	}

	public String getEtime() {
		return etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	

	public Account() {
		super();
	}

	

	public Integer getAid() {
        return aid;
    }

    public void setAid(Integer aid) {
        this.aid = aid;
    }

    public String getSuser() {
        return suser;
    }

    public void setSuser(String suser) {
        this.suser = suser == null ? null : suser.trim();
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getRday() {
        return rday;
    }

    public void setRday(Integer rday) {
        this.rday = rday;
    }

    public Integer getConsumption() {
        return consumption;
    }

    public void setConsumption(Integer consumption) {
        this.consumption = consumption;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date == null ? null : date.trim();
    }

	@Override
	public String toString() {
		return "Account [aid=" + aid + ", suser=" + suser + ", cname=" + cname + ", rday=" + rday + ", consumption="
				+ consumption + ", date=" + date + ", etime=" + etime + ", status=" + status + ", imgp=" + imgp + "]";
	}
    
    
    
}