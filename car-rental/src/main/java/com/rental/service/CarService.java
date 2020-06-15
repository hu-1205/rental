package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.bean.Car;
import com.rental.dao.CarMapper;

@Service
public class CarService {
	
	@Autowired
	CarMapper carMapper;

	public List<Car> selectCar() {
		// TODO Auto-generated method stub
		
		return carMapper.selectCars();
	}

	public Car selectById(int cid) {
		// TODO Auto-generated method stub
		return carMapper.selectByPrimaryKey(cid);
	}

	public Car selectByName(String cname) {
		// TODO Auto-generated method stub
		return carMapper.selectByName(cname);
	}

	public int insertCar(Car car) {
		// TODO Auto-generated method stub
		return carMapper.insert(car);
	}

	public int deleteCarById(int cid) {
		// TODO Auto-generated method stub
		return carMapper.deleteByPrimaryKey(cid);
	}

	public List<Car> searchCar(String date) {
		// TODO Auto-generated method stub
		return carMapper.searchCar(date);
	}

	public void updateRemaining(Integer cid, int remaining) {
		// TODO Auto-generated method stub
		carMapper.updateRemaining(cid,remaining);
		
	}

}
