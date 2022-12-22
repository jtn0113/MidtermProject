package com.skilldistillery.sip.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class BeerTest {

	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Beer beer;
	
	@BeforeAll
	static void setUpBeforeClass() throws Exception {
	    emf = Persistence.createEntityManagerFactory("JPASip");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
	    emf.close();
	}
	
	@BeforeEach
	void setUp() throws Exception {
	    em = emf.createEntityManager();
	    beer = em.find(Beer.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    beer = null;
	}
	@Test
	void test_beer_brew_type_id_mapping() {
		assertNotNull(beer);
		assertEquals(2, beer.getBrewTypeId());
		assertEquals("Bud Light Lime", beer.getName());
	}

}
