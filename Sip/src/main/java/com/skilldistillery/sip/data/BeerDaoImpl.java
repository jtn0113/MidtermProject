package com.skilldistillery.sip.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sip.entities.Beer;
import com.skilldistillery.sip.entities.BeerTasting;
import com.skilldistillery.sip.entities.User;

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
	

	
	@Override
	 public BeerTasting beerJournalEntry(BeerTasting beerTasting, Integer beerId, User user) {
	   Beer beer = em.find(Beer.class, beerId);
	   if(beer != null) {
		   beerTasting.setBeer(beer);
		   beerTasting.setUser(user);
		   em.persist(beerTasting);
		   return beerTasting;
	   }
	   return null;
	}
	
	@Override
	public List<BeerTasting> searchBeerTastings(String searchTerm, User user) {
		List<BeerTasting> results = new ArrayList<BeerTasting>();
		
		for (BeerTasting beerTasting : user.getBeerTasting()) {
			if(beerTasting.getBeer().getName().contains(searchTerm)) {
				results.add(beerTasting);
			}
		}
		
		return results;
	}
}
