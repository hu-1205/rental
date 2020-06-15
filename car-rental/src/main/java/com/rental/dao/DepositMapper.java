package com.rental.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rental.bean.Deposit;

public interface DepositMapper {
	
	List<Deposit> selectAllDeposit();
	
	Deposit selectDeposit(@Param("did")int did);
	
	void deleteById(@Param("did")int did);
	
	void insertDeposit(Deposit deposit);
	
	void updateFlage(@Param("did")int did,@Param("flag")int flag);

	void deleteName(@Param("username")String username);
}
