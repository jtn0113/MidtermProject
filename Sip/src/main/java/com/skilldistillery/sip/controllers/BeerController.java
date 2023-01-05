package com.skilldistillery.sip.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.sip.data.BeerDao;
import com.skilldistillery.sip.entities.Beer;
import com.skilldistillery.sip.entities.BeerTasting;
import com.skilldistillery.sip.entities.User;

@Controller
public class BeerController {

	@Autowired
	private BeerDao beerDao;

	@RequestMapping("beer.do")
	public String createBeer(Beer beer, Model model) {
		System.out.println(beer.toString());
		beerDao.createBeer(beer);
		System.out.println(beerDao.createBeer(beer));
		model.addAttribute("beer", beer);

		return "beerJournal";
	}

	@RequestMapping("findAllBeers.do")
	public String selectBeer(Model model) {
		model.addAttribute("beers", beerDao.findAllBeers());
		return "beer";
	}

	@RequestMapping("selectBeer.do")
	public String selectBeer(@RequestParam int id, Model model) {
		Beer beer = beerDao.findById(id);
		model.addAttribute("beer", beer);
		System.out.println(beer);

		return "beerJournal";
	}

	@RequestMapping("beerJournal.do")
	public String journalEntry(@RequestParam Integer beerId, BeerTasting beerTasting, Model model,
			HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {

			beerDao.beerJournalEntry(beerTasting, beerId, user);
			model.addAttribute("beerTasting", beerTasting);
			System.out.println(beerTasting);
			return "home";
		} else {
			return "login";
		}
	}

}
