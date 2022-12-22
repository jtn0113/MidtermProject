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

class BrewTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private BrewType brew;

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
	    brew = em.find(BrewType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    brew = null;
	}
	@Test
	void test_brew_type_id_name() {
		assertNotNull(brew);
		assertEquals(1, brew.getId());
		assertEquals("Pilsner", brew.getName());
	}
}
