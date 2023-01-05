package com.skilldistillery.sip.data;

import java.util.List;

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
	
	@Override
	public List<Beer> findAllBeers() {
		String jpql = "SELECT b FROM Beer b ORDER BY b.name";
		return em.createQuery(jpql, Beer.class).getResultList();
	}
	
	@Override
	public Beer findById(int id) {
		return em.find(Beer.class, id);
	}
	
//	@Override
//	public List<NationalPark> findAll() {
//		String jpql = "SELECT p FROM NationalPark p ORDER BY p.name";
//		return em.createQuery(jpql, NationalPark.class).getResultList();
//	}
	
}
