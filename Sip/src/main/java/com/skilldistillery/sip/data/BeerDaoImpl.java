package com.skilldistillery.sip.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sip.entities.Beer;

@Service
@Transactional
public class BeerDaoImpl implements BeerDao {

	@PersistenceContext
	private EntityManager em; 
	
	@Override
	public Beer createBeer(Beer beer) {
		em.persist(beer);
		return beer;
	}
	
	
}
