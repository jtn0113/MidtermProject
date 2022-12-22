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

class WineColorTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private WineColor wineColor;

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
	    wineColor = em.find(WineColor.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
	    em.close();
	    wineColor = null;
	}
	@Test
	void test_wine_color_type_id_name() {
		assertNotNull(wineColor);
		assertEquals("Red", wineColor.getColor());
		assertEquals("Sweet", wineColor.getDescription());
	}
}
