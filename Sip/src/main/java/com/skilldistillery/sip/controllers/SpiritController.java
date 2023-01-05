package com.skilldistillery.sip.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.sip.data.SpiritDao;
import com.skilldistillery.sip.entities.Spirit;
import com.skilldistillery.sip.entities.SpiritTasting;
import com.skilldistillery.sip.entities.User;

@Controller
public class SpiritController {

	@Autowired
	private SpiritDao spiritDao;

	@RequestMapping("spirit.do")
	public String createspirit(Spirit spirit, Model model) {
		System.out.println(spirit.toString());
		spiritDao.createSpirit(spirit);
		System.out.println(spiritDao.createSpirit(spirit));
		model.addAttribute("spirit", spirit);

		return "spiritJournal";
	}

	@RequestMapping("findAllSpirits.do")
	public String selectspirit(Model model) {
		model.addAttribute("spirits", spiritDao.findAllSpirits());
		return "spirit";
	}

	@RequestMapping("selectSpirit.do")
	public String selectSpirit(@RequestParam int id, Model model) {
		Spirit spirit = spiritDao.findById(id);
		model.addAttribute("spirit", spirit);
		System.out.println(spirit);

		return "spiritJournal";
	}

	@RequestMapping("spiritJournal.do")
	public String journalEntry(@RequestParam Integer spiritId, SpiritTasting spiritTasting, Model model,
			HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {

			spiritDao.spiritJournalEntry(spiritTasting, spiritId, user);
			model.addAttribute("spiritTasting", spiritTasting);
			System.out.println(spiritTasting);
			return "home";
		} else {
			return "login";
		}
	}
}
