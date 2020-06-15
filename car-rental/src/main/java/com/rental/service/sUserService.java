package com.rental.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.bean.sUser;
import com.rental.dao.sUserMapper;

@Service
public class sUserService {
	
	@Autowired
	sUserMapper suserMapper;

	public sUser psdTest(String username) {
		return suserMapper.selectByPrimaryKey(username);
	}
	
	public int userInsert(sUser suser) {
		return suserMapper.insert(suser);
	}

	public int selectUsername(String username) {
		// TODO Auto-generated method stub
		return suserMapper.countByName(username);
	}

	public void updatesUser(sUser sUser) {
		// TODO Auto-generated method stub
		int updateByKey = suserMapper.updateByPrimaryKey(sUser);
	}

	public void deletesUser(String username) {
		// TODO Auto-generated method stub
		suserMapper.deleteByPrimaryKey(username);
	}

	public sUser selectByName(String username) {
		// TODO Auto-generated method stub
		return suserMapper.selectByPrimaryKey(username);
	}

	public void updatesUserMoney(String username, int money) {
		// TODO Auto-generated method stub
		suserMapper.updatesUserMoney(username,money);
	}

	
	public void updatesUserDeposit( int deposit,String username) {
		// TODO Auto-generated method stub
		suserMapper.updatesUserDeposit(deposit,username);
	}

	public void updatePassword(String username, String password) {
		// TODO Auto-generated method stub
		suserMapper.updatePassword(username,password);
		
	}


}
