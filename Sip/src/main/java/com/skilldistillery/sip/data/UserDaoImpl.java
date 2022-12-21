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
		// TODO Auto-generated method stub
		return null;
	}

}
