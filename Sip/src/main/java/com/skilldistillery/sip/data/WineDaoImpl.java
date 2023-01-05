package com.skilldistillery.sip.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sip.entities.Wine;

@Service
@Transactional
public class WineDaoImpl implements WineDao {
	
	@PersistenceContext
	private EntityManager em; 

	@Override
	public Wine createWine(Wine wine) {
		em.persist(wine);
		return wine;
	}

}
