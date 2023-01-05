package com.skilldistillery.sip.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sip.entities.Spirit;

@Service
@Transactional
public class SpiritDaoImpl implements SpiritDao {

	@PersistenceContext
	private EntityManager em; 

	@Override 
	public Spirit createSpirit(Spirit spirit) {
		em.persist(spirit);
		return spirit;
	}
}
