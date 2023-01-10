package com.skilldistillery.sip.data;

import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.sip.entities.Wine;
import com.skilldistillery.sip.entities.WineTasting;
import com.skilldistillery.sip.entities.User;
import com.skilldistillery.sip.entities.Wine;
import com.skilldistillery.sip.entities.WineTasting;

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

	@Override
	public List<Wine> findAllWines() {
		String jpql = "SELECT s FROM Wine s ORDER BY s.name";
		return em.createQuery(jpql, Wine.class).getResultList();
	}

	@Override
	public Wine findById(int id) {
		return em.find(Wine.class, id);
	}

	@Override
	public WineTasting wineJournalEntry(WineTasting wineTasting, Integer wineId, User user) {
		Wine wine = em.find(Wine.class, wineId);
		if (wine != null) {
			wineTasting.setWine(wine);
			wineTasting.setUser(user);
			em.persist(wineTasting);
			return wineTasting;
		}
		return null;
	}

	@Override
	public WineTasting updateWine(WineTasting wineTasting, Integer wineId) {
		WineTasting edit = em.find(WineTasting.class, wineId);
		if (edit != null) {
			edit.setNotes(wineTasting.getNotes());
			edit.setPrice(wineTasting.getPrice());
			edit.setRating(wineTasting.getRating());
			edit.setPhoto(wineTasting.getPhoto());
			edit.setDateSampled(wineTasting.getDateSampled());
		}
		return edit;
	}

	@Override
	public WineTasting findByJournalId(int id) {
		return em.find(WineTasting.class, id);
	}

	@Override
	public boolean delete(int id) {
		boolean success = false;
		WineTasting wineTasting = em.find(WineTasting.class, id);
		if (wineTasting != null) {
			em.remove(wineTasting);
			success = !em.contains(wineTasting);
		}
		return success;
	}

}
