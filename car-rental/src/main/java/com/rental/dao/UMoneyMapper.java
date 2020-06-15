package com.rental.dao;

import com.rental.bean.UMoney;
import com.rental.bean.UMoneyExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface UMoneyMapper {
    long countByExample(UMoneyExample example);

    int deleteByExample(UMoneyExample example);

    int deleteByPrimaryKey(String username);

    int insert(UMoney record);

    int insertSelective(UMoney record);

    List<UMoney> selectByExample(UMoneyExample example);

    UMoney selectByPrimaryKey(String username);

    int updateByExampleSelective(@Param("record") UMoney record, @Param("example") UMoneyExample example);

    int updateByExample(@Param("record") UMoney record, @Param("example") UMoneyExample example);

    int updateByPrimaryKeySelective(UMoney record);

    int updateByPrimaryKey(UMoney record);
}