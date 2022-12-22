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

class SpiritTypeTest {
	private static EntityManagerFactory emf;
	private EntityManager em;
	private SpiritType type;

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
	    type = em.find(SpiritType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    type = null;
	}
	@Test
	void test_Spirit_type_type_id_name() {
		assertNotNull(type);
		assertEquals("Whiskey", type.getName());
	}

}
