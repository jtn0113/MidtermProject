package com.skilldistillery.sip.data;

import java.util.List;

import com.skilldistillery.sip.entities.User;
import com.skilldistillery.sip.entities.Wine;
import com.skilldistillery.sip.entities.WineTasting;

public interface WineDao {
	
	Wine createWine(Wine wine);

	List<Wine> findAllWines();

	Wine findById(int id);

	public WineTasting wineJournalEntry(WineTasting wineTasting, Integer wineId, User user);
	
	

}
