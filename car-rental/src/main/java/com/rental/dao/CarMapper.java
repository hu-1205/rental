package com.rental.dao;

import com.rental.bean.Car;
import com.rental.bean.CarExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CarMapper {
    long countByExample(CarExample example);

    int deleteByExample(CarExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(Car record);

    int insertSelective(Car record);

    List<Car> selectByExample(CarExample example);
    
    List<Car> selectCars();

    Car selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") Car record, @Param("example") CarExample example);

    int updateByExample(@Param("record") Car record, @Param("example") CarExample example);

    int updateByPrimaryKeySelective(Car record);

    int updateByPrimaryKey(Car record);

	Car selectByName(String cname);
	
	List<Car> searchCar(@Param("date")String date);

	void updateRemaining(@Param("cid") Integer cid,@Param("remaining") int remaining);
}