package com.skilldistillery.sip.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

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
		String jpql = "select u from User u where u.username  = :uid";
		User user = em.createQuery(jpql, User.class).setParameter("uid", username).getSingleResult();
		if (user != null) {

			if (user.getPassword().equals(password)) {

				return user;
			}

		}
		return null;
	}

	@Override
	public User create(User user) {
		em.persist(user);
		return user;
	}

}
