package com.skilldistillery.sip.data;

import java.util.List;

import com.skilldistillery.sip.entities.Address;
import com.skilldistillery.sip.entities.User;

public interface UserDAO {

	User findById(int userId);
	User findUsernameAndPassword(String username, String password);
	User create(User user);
	Address createAddress(Address address);
	User editInformation(Integer userId, User user);
//	int dateOfBirth(User user);
	List<User> findFriendsForUser(int userId);
	boolean deactivated(int userId);
	boolean activateAccount(int userId);
	List<User> findActiveAccounts();
	List<User> findDeactivatedAccounts();
	User findFriendByUsername(String username);
	List<User> findAllUsers();
	boolean addFriendToUser(String usernameOfFriend, User user);
	boolean removeFriendFromUser(int friendId, User user);
	List<String> checkUsername();
}
 