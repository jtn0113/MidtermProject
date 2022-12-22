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

class WineTastingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private WineTasting wineTasting;

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
	    wineTasting = em.find(WineTasting.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    wineTasting = null;
	}
	@Test
	void test_wine_tasting_type_id_name() {
		assertNotNull(wineTasting);
		assertEquals(1, wineTasting.getUser().getId());
		assertEquals(8, wineTasting.getPrice());
		assertEquals("Coppola Vineyard", wineTasting.getWine().getVineyardName());
		
	}
}
