package com.rental.dao;

import com.rental.bean.Account;
import com.rental.bean.AccountExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AccountMapper {
    long countByExample(AccountExample example);

    int deleteByExample(AccountExample example);

    int deleteByPrimaryKey(Integer aid);

    int insert(Account record);
    
    int insertAll(Account record);
    

    int insertSelective(Account record);
    
    List<Account> selevtAccountByName(@Param("username")String username,@Param("status")String status);
    
    List<Account> selectByExample(AccountExample example);
        
    List<Account> selectByName(String username);
    
    List<Account> selectByNameAll(String username);
    
    List<Account> selevtAccountByStatus(String Status);
    
    Account selectAccountById(Integer aid);
    
    Account selectByPrimaryKey(Integer aid);

    int updateByExampleSelective(@Param("record") Account record, @Param("example") AccountExample example);

    int updateByExample(@Param("record") Account record, @Param("example") AccountExample example);

    int updateByPrimaryKeySelective(Account record);

    int updateByPrimaryKey(Account record);

	void updateById(@Param("aid") Integer aid,@Param("format") String format);

	int updateStatus(@Param("aid")int aid, @Param("status")String status);
	
	void updateDM(@Param("aid")int aid, @Param("rday")int rday,@Param("consumption")int smoney);

	void deleteName(@Param("username")String username);
}