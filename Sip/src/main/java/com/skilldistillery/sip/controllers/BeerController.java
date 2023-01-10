package com.skilldistillery.sip.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.sip.data.BeerDao;
import com.skilldistillery.sip.data.UserDAO;
import com.skilldistillery.sip.entities.Beer;
import com.skilldistillery.sip.entities.BeerTasting;
import com.skilldistillery.sip.entities.User;

@Controller
public class BeerController {

	@Autowired
	private BeerDao beerDao;
	
	@Autowired
	private UserDAO userDao;

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
			session.setAttribute("loggedInUser", userDao.findById(user.getId()));
			return "home";
		} else {
			return "login";
		}
	}
@RequestMapping("editBeer.do")
public String editBeer(@RequestParam Integer beerId, BeerTasting beerTasting, Model model, HttpSession session) {
	BeerTasting edit = beerDao.updateBeer(beerTasting, beerId);
	User user = (User) session.getAttribute("loggedInUser");

	//session.setAttribute("beerTasting", edit);
	session.setAttribute("loggedInUser", userDao.findById(user.getId()));
	return"home";
}
@RequestMapping("updateBeer.do")
public String updateBeer(@RequestParam int id, Model model, HttpSession session) {
	//model.addAttribute("beerTasting", beerTasting);
	BeerTasting bt = beerDao.findByJournalId(id);
	model.addAttribute("beerTasting", bt);
	return "updateBeer";
}

@RequestMapping("deleteBeer.do")
public String deleteBeer(@RequestParam int id, Model model, HttpSession session) {
	User user = (User) session.getAttribute("loggedInUser");
	beerDao.delete(id);
	session.setAttribute("loggedInUser", userDao.findById(user.getId()));
	return "home";
}
@RequestMapping("deleteConfirm.do")
public String deleteConfirm(@RequestParam int id, BeerTasting beerTasting, Model model, HttpSession session) {
	BeerTasting bt = beerDao.findByJournalId(id);
	model.addAttribute("beerTasting", bt);
	return "deleteConfirm";
}
}
