package com.rental.dao;

import java.util.List;

import com.rental.bean.Administrator;

public interface AdministratorMapper {
	
	
	List<Administrator> selectAll();
	
	Administrator selectAllByName(String name);
}
