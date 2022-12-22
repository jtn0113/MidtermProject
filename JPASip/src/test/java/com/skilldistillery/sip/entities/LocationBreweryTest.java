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

class LocationBreweryTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private LocationBrewery brewery;

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
	    brewery = em.find(LocationBrewery.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    brewery = null;
	}

	@Test
	void test_brewery_type_id_name() {
		assertNotNull(brewery);
		assertEquals("Bob's Brews", brewery.getName());
		assertEquals(1, brewery.getAddress().getId());
	}
}
