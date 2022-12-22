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

class WineTypeTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private WineType wineType;

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
	    wineType = em.find(WineType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    wineType = null;
	}
	@Test
	void test_wine_type_type_id_name() {
		assertNotNull(wineType);
		assertEquals("Pinot Noir", wineType.getName());
		assertEquals(1, wineType.getWineColorId());
	}
}
