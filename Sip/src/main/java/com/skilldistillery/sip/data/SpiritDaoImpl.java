package com.skilldistillery.sip.data;

import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sip.entities.BeerTasting;
import com.skilldistillery.sip.entities.Spirit;
import com.skilldistillery.sip.entities.SpiritTasting;
import com.skilldistillery.sip.entities.User;

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

	@Override
	public List<Spirit> findAllSpirits() {
		String jpql = "SELECT s FROM Spirit s ORDER BY s.name";
		return em.createQuery(jpql, Spirit.class).getResultList();
		
	}

	@Override
	public Spirit findById(int id) {
	
			return em.find(Spirit.class, id);
	}

	@Override
	public SpiritTasting spiritJournalEntry(SpiritTasting spiritTasting, Integer spiritId, User user) {
		   Spirit spirit = em.find(Spirit.class, spiritId);
		   if(spirit != null) {
			   spiritTasting.setSpirit(spirit);
			   spiritTasting.setUser(user);
			   em.persist(spiritTasting);
			   return spiritTasting;
	}
	return null;
	
	}

	@Override
	public SpiritTasting updateSpirit(SpiritTasting spiritTasting, Integer spiritId) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MMM-dd");
		SpiritTasting edit = em.find(SpiritTasting.class, spiritId);
		if (edit != null) {
			// LocalDate date = LocalDate.parse(beerTasting.getDateSampled(), formatter);
			edit.setNotes(spiritTasting.getNotes());
			edit.setPrice(spiritTasting.getPrice());

			edit.setRating(spiritTasting.getRating());

			edit.setPhoto(spiritTasting.getPhoto());
		}
			return edit;
	}

	@Override
	public SpiritTasting findByJournalId(int id) {
		return em.find(SpiritTasting.class, id);
	}

	@Override
	public boolean delete(int id) {
		boolean success = false;
		SpiritTasting spiritTasting = em.find(SpiritTasting.class, id);
		if (spiritTasting != null) {
			em.remove(spiritTasting);
			success = !em.contains(spiritTasting);
		}
		return success;
	}
	}
