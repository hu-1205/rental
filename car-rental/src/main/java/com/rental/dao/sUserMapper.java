package com.rental.dao;

import com.rental.bean.sUser;
import com.rental.bean.sUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.context.annotation.Primary;

public interface sUserMapper {
    long countByExample(sUserExample example);

    int deleteByExample(sUserExample example);

    int deleteByPrimaryKey(String username);
    
    int countByName(String username);

    int insert(sUser suser);

    int insertSelective(sUser record);

    List<sUser> selectByExample(sUserExample example);

    sUser selectByPrimaryKey(String username);
    
    int updatesUserMoney(@Param("username")String username,@Param("money")int money);

    int updateByExampleSelective(@Param("record") sUser record, @Param("example") sUserExample example);

    int updateByExample(@Param("record") sUser record, @Param("example") sUserExample example);

    int updateByPrimaryKeySelective(sUser record);
    
    void updatesUserDeposit(@Param("deposit") int deposit,@Param("username")String username);

    int updateByPrimaryKey(sUser record);

	void updatePassword(@Param("username") String username,@Param("password") String password);
}