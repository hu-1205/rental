package com.rental.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rental.bean.User;
import com.rental.dao.UserMapper;

@Service
public class UserService {
	
	@Autowired
	UserMapper userMapper;
	
	public int userInsert(User user) {
		return userMapper.insert(user);
	}

	public List<User> selectAllUser() {
		// TODO Auto-generated method stub
		return userMapper.selectAllUser();
	}

	public int DeleteUser(int id) {
		// TODO Auto-generated method stub
		return userMapper.deleteByPrimaryKey(id);
		
	}

	public User searchUser(int id) {
		// TODO Auto-generated method stub
		return userMapper.selectByPrimaryKey(id);
	}

	public int updateUser(User user) {
		// TODO Auto-generated method stub
		return userMapper.updateByPrimaryKey(user);
		
	}

	public List<User> AsearchUser(String date) {
		// TODO Auto-generated method stub
		return userMapper.AsearchUser(date);
	}

	public void updatePassword(String username, String password) {
		// TODO Auto-generated method stub
		userMapper.updatePassword(username,password);
	}
}
