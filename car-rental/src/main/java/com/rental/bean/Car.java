package com.rental.bean;

public class Car {
    private Integer cid;

    private String cname;

    private Integer cride;

    private Integer dayr;

    private String imgadd;
    
    private String block;
    
    private Integer duration;
    
    private Integer remaining;
    
    
    
    

    public Car(Integer cid, String cname, Integer cride, Integer dayr, String imgadd, String block, Integer duration,
			Integer remaining) {
		super();
		this.cid = cid;
		this.cname = cname;
		this.cride = cride;
		this.dayr = dayr;
		this.imgadd = imgadd;
		this.block = block;
		this.duration = duration;
		this.remaining = remaining;
	}
    
    

	public Car(String cname, Integer cride, Integer dayr, String imgadd, String block, Integer duration,
			Integer remaining) {
		super();
		this.cname = cname;
		this.cride = cride;
		this.dayr = dayr;
		this.imgadd = imgadd;
		this.block = block;
		this.duration = duration;
		this.remaining = remaining;
	}



	public String getBlock() {
		return block;
	}

	public void setBlock(String block) {
		this.block = block;
	}

	public Integer getDuration() {
		return duration;
	}

	public void setDuration(Integer duration) {
		this.duration = duration;
	}

	public Integer getRemaining() {
		return remaining;
	}

	public void setRemaining(Integer remaining) {
		this.remaining = remaining;
	}

	public Car() {
		super();
	}

	public Car(String cname, Integer cride, Integer dayr, String imgadd) {
		super();
		this.cname = cname;
		this.cride = cride;
		this.dayr = dayr;
		this.imgadd = imgadd;
	}

	public Integer getCid() {
        return cid;
    }

    public void setCid(Integer cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname == null ? null : cname.trim();
    }

    public Integer getCride() {
        return cride;
    }

    public void setCride(Integer cride) {
        this.cride = cride;
    }

    public Integer getDayr() {
        return dayr;
    }

    public void setDayr(Integer dayr) {
        this.dayr = dayr;
    }

    public String getImgadd() {
        return imgadd;
    }

    public void setImgadd(String imgadd) {
        this.imgadd = imgadd == null ? null : imgadd.trim();
    }



	@Override
	public String toString() {
		return "Car [cid=" + cid + ", cname=" + cname + ", cride=" + cride + ", dayr=" + dayr + ", imgadd=" + imgadd
				+ ", block=" + block + ", duration=" + duration + ", remaining=" + remaining + "]";
	}
    
    
}