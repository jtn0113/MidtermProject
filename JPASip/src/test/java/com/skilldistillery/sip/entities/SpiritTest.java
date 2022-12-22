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

class SpiritTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Spirit spirit;

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
	    spirit = em.find(Spirit.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    spirit = null;
	}
	@Test
	void test_spirit_type_id_name() {
		assertNotNull(spirit);
		assertEquals(3, spirit.getSpiritTypeId());
		assertEquals("Tito's", spirit.getName());
	}

}
