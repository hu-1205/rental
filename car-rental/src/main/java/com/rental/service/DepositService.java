package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.bean.Deposit;
import com.rental.dao.DepositMapper;

@Service
public class DepositService {
	@Autowired
	DepositMapper depositMapper;

	public List<Deposit> selectAllDeposit() {
		// TODO Auto-generated method stub
		return depositMapper.selectAllDeposit();
	}

	public void insertDeposit(Deposit deposit) {
		// TODO Auto-generated method stub
		depositMapper.insertDeposit(deposit);
		
	}

	public Deposit selectDeposit(int did) {
		// TODO Auto-generated method stub
		return depositMapper.selectDeposit(did);
	}

	public void updateFlage(int did, int flag) {
		// TODO Auto-generated method stub
		depositMapper.updateFlage(did,flag);
	}

	public void deleteName(String username) {
		// TODO Auto-generated method stub
		depositMapper.deleteName(username);
		
	}
}
