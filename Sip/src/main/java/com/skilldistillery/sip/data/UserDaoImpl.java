package com.skilldistillery.sip.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sip.entities.Address;
import com.skilldistillery.sip.entities.Spirit;
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
	public Spirit createSpiritTasting(Spirit spirit) {
		Spirit journal = new Spirit();
		em.persist(journal);
		return journal;		
	}
	@Override
	public Address createAddress(Address address) {
		Address addr = new Address();
		em.persist(addr);
		return addr;
	}
	
	

}
