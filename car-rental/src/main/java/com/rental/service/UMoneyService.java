package com.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.bean.UMoney;
import com.rental.dao.UMoneyMapper;

@Service
public class UMoneyService {
	
	@Autowired
	UMoneyMapper uMoneyMapper;

	public void insertUMoney(UMoney uMoney) {
		
		uMoneyMapper.insert(uMoney);
		// TODO Auto-generated method stub
		
	}

	public UMoney selectByName(String suser) {
		// TODO Auto-generated method stub
		return uMoneyMapper.selectByPrimaryKey(suser);
	}

	public void updateUMoney(UMoney uMoney) {
		// TODO Auto-generated method stub
		uMoneyMapper.updateByPrimaryKey(uMoney);
		
	}
	
}
