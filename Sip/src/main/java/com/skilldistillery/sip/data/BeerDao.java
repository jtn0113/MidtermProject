package com.skilldistillery.sip.data;

import java.util.List;

import com.skilldistillery.sip.entities.Beer;

public interface BeerDao {

	Beer createBeer(Beer beer);

	List<Beer> findAllBeers();

	Beer findById(int id);

}
