package com.skilldistillery.sip.data;

import com.skilldistillery.sip.entities.User;

public interface UserDAO {

	User findById(int userId);
	User findUsernameAndPassword(String username, String password);
	User create(User user);
}
