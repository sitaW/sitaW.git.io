package com.dtproject.service.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.dtproject.dao.UserDao;
import com.dtproject.model.User;
import com.dtproject.service.UserService;
@Repository
public class UserServiceImpl implements UserService
{

	@Autowired
	UserDao userDao;
	@Override
	public void saveUser(User user) 
	{

		userDao.saveUser(user);
		
	}
	@Override
	public User findUserByName(String username) {
		
		return userDao.findUserByName(username);
	}

}
