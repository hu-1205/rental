package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.bean.Uaudit;
import com.rental.dao.UauditMapper;

@Service
public class UauditService {
	
	@Autowired
	UauditMapper uauditMapper;

	public void insertUaudit(Uaudit uaudit) {
		// TODO Auto-generated method stub
		uauditMapper.insertUaudit(uaudit);
	}

	public List<Uaudit> selectByName(String username) {
		// TODO Auto-generated method stub
		return uauditMapper.selectByName(username);
	}

	public Uaudit selectById(int zid) {
		// TODO Auto-generated method stub
		return uauditMapper.selectById(zid);
	}

	public void deleteUauditById(int zid) {
		// TODO Auto-generated method stub
		uauditMapper.deleteUauditById(zid);
	}

	

	

}
