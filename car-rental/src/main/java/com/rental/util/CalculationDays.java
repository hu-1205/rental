package com.rental.util;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CalculationDays {
	
	String Starttime;
	String Endtime;
	
	
	
	
	public CalculationDays() {
		super();
	}




	public int CalculationDay(String Starttime,String Endtime) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
	    try  
	    {  
	      Date d1 = df.parse(Endtime);  
	      Date d2 = df.parse(Starttime);  
	      long diff = d1.getTime() - d2.getTime();//这样得到的差值是毫秒级别  
	      long days = diff / (1000 * 60 * 60 * 24);
	      return (int) days;
	    }catch (Exception e)  
	    {  
	    	e.printStackTrace();
	    	return 3;
	    }  
	}
}
