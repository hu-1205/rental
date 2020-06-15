package com.rental.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rental.bean.Car;
import com.rental.bean.Msg;
import com.rental.bean.User;
import com.rental.service.CarService;
import com.rental.service.UserService;

@Controller
public class utilController {
	
	@Autowired
	CarService carService;
	
	@Autowired
	UserService userService;
	
	@ResponseBody
	@RequestMapping("/searchCar")
	public Msg searchCar(String date) {
		
		List<Car> cars = carService.searchCar(date);
		
		return Msg.success().add("cars", cars);
	}
	
	@ResponseBody
	@RequestMapping("/AsearchUser")
	public Msg AsearchUser(String date) {
		
		List<User> users = userService.AsearchUser(date);
		
		return Msg.success().add("cars", users);
	}
	
	
}
