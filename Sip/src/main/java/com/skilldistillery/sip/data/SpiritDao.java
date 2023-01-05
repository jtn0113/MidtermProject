package com.skilldistillery.sip.data;

import java.util.List;

import com.skilldistillery.sip.entities.Spirit;
import com.skilldistillery.sip.entities.SpiritTasting;
import com.skilldistillery.sip.entities.User;

public interface SpiritDao {
	Spirit createSpirit(Spirit spirit);

	List <Spirit> findAllSpirits();

	Spirit findById(int id);

  public SpiritTasting spiritJournalEntry(SpiritTasting spiritTasting, Integer spiritId, User user);
}
