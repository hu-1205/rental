package com.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.bean.Administrator;
import com.rental.dao.AdministratorMapper;

@Service
public class AdministratorService {
	
	@Autowired
	AdministratorMapper administratorMapper;

	public Administrator selectAllByName(String name) {
		// TODO Auto-generated method stub
		return administratorMapper.selectAllByName(name);
	}
}
