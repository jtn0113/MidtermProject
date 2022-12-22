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

class SpiritTastingTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private SpiritTasting spiritTasting;

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
	    spiritTasting = em.find(SpiritTasting.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    spiritTasting = null;
	}
	@Test
	void test_spiritTasting_type_id_name() {
		assertNotNull(spiritTasting);
		assertEquals(1, spiritTasting.getUser().getId());
		assertEquals(1, spiritTasting.getSpirit().getId());
	}

}
