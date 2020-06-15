package com.rental.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rental.bean.Driver;

public interface DriverMapper {
	
	int insertDriver(Driver driver);
	
	Driver selectByName(String username);
	
	List<Driver> selectAll(String flag);

	void updateFlag(@Param("name")String name,@Param("i") String i);

	void deleteDriver(String username);

}
