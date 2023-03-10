package com.skilldistillery.sip.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.sip.data.UserDAO;
import com.skilldistillery.sip.data.WineDao;
import com.skilldistillery.sip.entities.WineTasting;
import com.skilldistillery.sip.entities.User;
import com.skilldistillery.sip.entities.Wine;
import com.skilldistillery.sip.entities.WineTasting;

@Controller
public class WineController {

	@Autowired
	private WineDao wineDao;
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping("wine.do")
	public String createWine(Wine wine, Model model) {
		System.out.println(wine.toString());
		wineDao.createWine(wine);
		System.out.println(wineDao.createWine(wine));
		model.addAttribute("wine", wine);
		
		return "wineJournal";
	}
	
	
	@RequestMapping("findAllWines.do")
	public String selectwine(Model model) {
		model.addAttribute("wines", wineDao.findAllWines());
		return "wine";
	}

	@RequestMapping("selectWine.do")
	public String selectWine(@RequestParam int id, Model model) {
		Wine wine = wineDao.findById(id);
		model.addAttribute("wine", wine);
		System.out.println(wine);

		return "wineJournal";
	}

	@RequestMapping("wineJournal.do")
	public String journalEntry(@RequestParam Integer wineId, WineTasting wineTasting, Model model,
			HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		if (user != null) {

			wineDao.wineJournalEntry(wineTasting, wineId, user);
			model.addAttribute("wineTasting", wineTasting);
			System.out.println(wineTasting);
			session.setAttribute("loggedInUser", userDao.findById(user.getId()));
			model.addAttribute("friends", userDao.findFriendsForUser(user.getId()));
			return "home";
		} else {
			return "login";
		}
	}
	
	@RequestMapping("editWine.do")
	public String editWine(@RequestParam Integer wineId, WineTasting wineTasting, Model model, HttpSession session) {
		WineTasting edit = wineDao.updateWine(wineTasting, wineId);
		User user = (User) session.getAttribute("loggedInUser");

		//session.setAttribute("wineTasting", edit);
		session.setAttribute("loggedInUser", userDao.findById(user.getId()));
		model.addAttribute("friends", userDao.findFriendsForUser(user.getId()));
		return"home";
	}
	@RequestMapping("updateWine.do")
	public String updateWine(@RequestParam int id, Model model, HttpSession session) {
		//model.addAttribute("wineTasting", wineTasting);
		WineTasting bt = wineDao.findByJournalId(id);
		model.addAttribute("wineTasting", bt);
		return "updateWine";
	}

	@RequestMapping("deleteWine.do")
	public String deleteWine(@RequestParam int id, Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		wineDao.delete(id);
		session.setAttribute("loggedInUser", userDao.findById(user.getId()));
		model.addAttribute("friends", userDao.findFriendsForUser(user.getId()));
		return "home";
	}
	@RequestMapping("deleteConfirmWine.do")
	public String deleteConfirm(@RequestParam int id, WineTasting wineTasting, Model model, HttpSession session) {
		WineTasting bt = wineDao.findByJournalId(id);
		model.addAttribute("wineTasting", bt);
		return "deleteConfirmWine";
	}
	
}
