package com.skilldistillery.sip.data;

import java.util.List;

import com.skilldistillery.sip.entities.Beer;
import com.skilldistillery.sip.entities.BeerTasting;
import com.skilldistillery.sip.entities.User;

public interface BeerDao {

	Beer createBeer(Beer beer);

	List<Beer> findAllBeers();

	Beer findById(int id);

	public BeerTasting beerJournalEntry(BeerTasting beerTasting, Integer beerId, User user);
}
