package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.rental.bean.Driver;
import com.rental.dao.DriverMapper;

@Service
public class DriverService {
	
	@Autowired
	DriverMapper driverMapper;
	
	
	public int insertDriver(Driver driver) {
		// TODO Auto-generated method stub
		return driverMapper.insertDriver(driver);
	}
	
	//调用全部待审核驾驶证
	public List<Driver> selectAll(){
		return driverMapper.selectAll("0");
	}

	public void updateFlag(String name) {
		// TODO Auto-generated method stub
		driverMapper.updateFlag(name,"1");
		
	}
	
	public void updateFlagB(String name) {
		// TODO Auto-generated method stub
		driverMapper.updateFlag(name,"2");
		
	}

	public Driver selectByName(String username) {
		// TODO Auto-generated method stub
		return driverMapper.selectByName(username);
		
	}

	public void deleteDriver(String username) {
		// TODO Auto-generated method stub
		driverMapper.deleteDriver(username);
	}
	

}
