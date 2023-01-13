package com.skilldistillery.sip.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sip.entities.Address;
import com.skilldistillery.sip.entities.BeerTasting;
import com.skilldistillery.sip.entities.User;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User findById(int userId) {

		return em.find(User.class, userId);
	}

	@Override
	public User findUsernameAndPassword(String username, String password) {
		User user = null;
		try {
			String jpql = "select u from User u where u.username  = :uid";
			user = em.createQuery(jpql, User.class).setParameter("uid", username).getSingleResult();

			if (user.getPassword().equals(password)) {

				return user;
			} else {
				return null;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public User create(User user) {
		em.persist(user);
		return user;
	}

	@Override
	public Address createAddress(Address address) {
		Address addr = new Address();
		em.persist(addr);
		return addr;
	}

	@Override
	public User editInformation(Integer userId, User user) {
		User userEdit = em.find(User.class, userId);
		if (userEdit != null) {
			userEdit.setFirstName(user.getFirstName());
			userEdit.setLastName(user.getLastName());
			userEdit.setUsername(user.getUsername());
			userEdit.setPassword(user.getPassword());
			userEdit.setAboutMe(user.getAboutMe());
			userEdit.setImage(user.getImage());
			em.persist(userEdit);
		}

		return userEdit;

	}

	@Override
	public List<User> findFriendsForUser(int userId) {

		//String jpql = "SELECT u.following FROM User u WHERE u.id = :userId";
		String jpql = "SELECT u.following FROM User u WHERE u.id = :userId";

		
		
		List<Object> objects = em.createQuery(jpql, Object.class).setParameter("userId", userId).getResultList();
		List<User> friends = new ArrayList<>();
		objects.forEach(o->friends.add((User)o));
		return friends;
	}
	
	
	@Override
	public boolean deactivated(int userId) {
		User user = em.find(User.class, userId);
		if (user != null) {
			user.setEnabled(false);
		}
		return user.getEnabled();
	}
	@Override
	public boolean activateAccount(int userId) {
		User user = em.find(User.class, userId);
		if (user != null) {
			user.setEnabled(true);
		}
		return user.getEnabled();
	}
	
	@Override
	public List<User> findActiveAccounts() {

		String jpql = "select u from User u where u.enabled  = 1";
		List<User> activeUsers = em.createQuery(jpql, User.class).getResultList();
		
		return activeUsers;
	}
	@Override
	public List<User> findDeactivatedAccounts() {
		
		String jpql = "select u from User u where u.enabled <> 1 OR u.enabled IS NULL";
		List<User> activeUsers = em.createQuery(jpql, User.class).getResultList();
		
		return activeUsers;
	}
	
	@Override
	public User findFriendByUsername(String usernameOfFriend) {
		String jpql = "SELECT u FROM User u WHERE u.username = :usernameOfFriend";
		try {
			User friend = em.createQuery(jpql, User.class).setParameter("usernameOfFriend", usernameOfFriend).getSingleResult();
			return friend;
		} catch (Exception e) {
			return null;
		}
	}
	
	@Override
	public List<String> checkUsername(){
		String jpql = "Select u.username FROM User u";
		List <String> usernames = em.createQuery(jpql, String.class).getResultList();
		return usernames;
	}
	
	
	@Override
	public List<User> findAllUsers() {
		String jpql = "SELECT u FROM User u";
		List<User> allUsers = em.createQuery(jpql, User.class).getResultList();
		
		return allUsers;
	}

	@Override
	public boolean addFriendToUser(String usernameOfFriend, User user) {
		User friend = findFriendByUsername(usernameOfFriend);
		user = findFriendByUsername(user.getUsername());
		if( ! user.getFollowing().contains(friend)) {
			user.addFriend(friend);
		} else {
			return false;
		}

		return user.getFollowing().contains(friend);
	}
	
	@Override
	public boolean removeFriendFromUser(int friendId, User user) {
		User friend = findById(friendId);
		user = findFriendByUsername(user.getUsername());
		user.removeFriend(friend);
		
		return true;
	}


}
