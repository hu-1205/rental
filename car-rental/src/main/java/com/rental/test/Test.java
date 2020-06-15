package com.rental.test;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;



public class Test {
	
	public static void main(String[] args) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");  
	    try  
	    {  
	      Date d1 = df.parse("2004-03-26");  
	      Date d2 = df.parse("2004-01-02");  
	      long diff = d1.getTime() - d2.getTime();//这样得到的差值是毫秒级别  
	      long days = diff / (1000 * 60 * 60 * 24); 
	      System.out.println(""+days+"天");  
	    }catch (Exception e)  
	    {  
	    }  


	
	}
}
