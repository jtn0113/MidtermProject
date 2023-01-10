package com.skilldistillery.sip.data;

import java.time.LocalDate;
import java.time.Period;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sip.entities.Address;
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
		if(userEdit != null) {
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
	public int dateOfBirth(User user) {
		LocalDate dob = user.getBirthDate();
		LocalDate today = LocalDate.now();
		return Period.between(dob, today).getYears();
	}

	@Override
	public List<User> findFriendsForUser(int userId) {
//		String jpqlBeer = "SELECT u FROM User u JOIN User f ON u.id 
		
		
		return null;
	}	

}
