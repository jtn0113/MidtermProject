package com.skilldistillery.sip.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

class BeerTastingTest{

	private static EntityManagerFactory emf;
	private EntityManager em;
	private BeerTasting tasting;

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
	    tasting = em.find(BeerTasting.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    tasting = null;
	}
	@Test
	void test_tasting_UserId_BeerId_mapping() {
		assertNotNull(tasting);
		assertEquals(1, tasting.getUserId());
		assertEquals(1, tasting.getBeerId());
	}
	}

