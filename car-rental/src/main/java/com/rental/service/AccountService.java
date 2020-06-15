package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.bean.Account;
import com.rental.bean.UMoney;
import com.rental.bean.sUser;
import com.rental.dao.AccountMapper;
import com.rental.dao.UMoneyMapper;

@Service
public class AccountService {

		@Autowired
		AccountMapper accountMapper;
		
		@Autowired
		UMoneyMapper uMoneyMapper;

		public List<Account> byNameAccount(String username) {
			// TODO Auto-generated method stub
			return accountMapper.selectByNameAll(username);
		}

		public UMoney selectByName(String username) {
			// TODO Auto-generated method stub
			
			return uMoneyMapper.selectByPrimaryKey(username);
			
		}



		public int insertAccont(Account account) {
			// TODO Auto-generated method stub
			return accountMapper.insertAll(account);
			
		}

		public int updateUMoney(UMoney uMoney) {
			// TODO Auto-generated method stub
			return uMoneyMapper.updateByPrimaryKey(uMoney);
		}

		public List<Account> selevtAccountByName(String username, String status) {
			// TODO Auto-generated method stub
			return accountMapper.selevtAccountByName(username, status);
		}

		public Account selectAccountById(int aid) {
			// TODO Auto-generated method stub
			return accountMapper.selectAccountById(aid);
		}

		public void updateDateByName(Integer aid, String format) {
			// TODO Auto-generated method stub
			System.out.println(aid);
			accountMapper.updateById(aid, format);
			
		}

		public int updateStatus(int aid) {
			// TODO Auto-generated method stub
			return accountMapper.updateStatus(aid,"2");
		}

		public List<Account> selevtAccountByStatus(String string) {
			// TODO Auto-generated method stub
			return accountMapper.selevtAccountByStatus("2");
		}

		public int changeAudit(int aid, String status) {
			// TODO Auto-generated method stub
			return accountMapper.updateStatus(aid, status);
		}

		public void updateDM(int aid, int day, int smoney) {
			// TODO Auto-generated method stub
			accountMapper.updateDM(aid,day,smoney);
			
		}

		public void deleteName(String username) {
			// TODO Auto-generated method stub
			accountMapper.deleteName(username);
		}

	
	

}
