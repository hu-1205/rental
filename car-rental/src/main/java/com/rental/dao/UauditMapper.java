package com.rental.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.rental.bean.Uaudit;

public interface UauditMapper {
	
	Uaudit selectById(int uid);
	
	void insertUaudit(Uaudit uaudit);
	
	Uaudit selectUaudit(String username);
	
	List<Uaudit> selectByName(String username);
	
	List<Uaudit> selectAllUaudit();
	
	void deleteUauditById(@Param("zid")int zid);
}
