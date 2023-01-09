package com.skilldistillery.sip.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.sip.data.BeerDao;
import com.skilldistillery.sip.data.SpiritDao;
import com.skilldistillery.sip.data.UserDAO;
import com.skilldistillery.sip.data.WineDao;
import com.skilldistillery.sip.entities.Address;
import com.skilldistillery.sip.entities.BeerTasting;
import com.skilldistillery.sip.entities.SpiritTasting;
import com.skilldistillery.sip.entities.User;
import com.skilldistillery.sip.entities.WineTasting;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	@Autowired
	private BeerDao beerDao;
	@Autowired
	private WineDao wineDao;
	@Autowired
	private SpiritDao spiritDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model, HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "login";
		} else {
			return "home";
		}
	}

	@RequestMapping("register.do")
	public String register() {
		return "register";
	}

//	@RequestMapping(path = {"createUser.do"}, method = RequestMethod.POST)
	@RequestMapping("createUser.do")
	public String createUser(User user, Address address, Model model) {
		userDao.create(user);
		model.addAttribute("user", user);
		model.addAttribute("addr", address);
		return "home";
	}

//	GET login.do displays the login view.
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String goToLogin(HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "login";
		} else {
			return "home";
		}
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(Model model, User user, HttpSession session) {
		User validatedUser = userDao.findUsernameAndPassword(user.getUsername(), user.getPassword());
		if (validatedUser == null) {
			String errorMessage = "Error: Username or password incorrect.";
			model.addAttribute("errorMessage", errorMessage);
			return "login";
		} else {
			session.setAttribute("loggedInUser", validatedUser);
			return "home";
		}
	}

	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "login";
	}

	@RequestMapping("account.do")
	public String account(Model model, User user, HttpSession session) {
		model.addAttribute("user", user);
		return "account";
	}

	@RequestMapping("editInformation.do")
	public String accountEdit(@RequestParam Integer userId, User user, Model model, HttpSession session) {
		User editUser = userDao.editInformation(userId, user);
		session.setAttribute("loggedInUser", editUser);
		return "home";
	}
	
	@RequestMapping("search.do")
	public String search(@RequestParam String searchTerm, HttpSession session, Model model, User user, @RequestParam int userId) {
		user = userDao.findById(userId);
		List<BeerTasting> beerResults = new ArrayList<BeerTasting>();
		List<WineTasting> wineResults = new ArrayList<WineTasting>();
		List<SpiritTasting> spiritResults = new ArrayList<SpiritTasting>();
		
		for (BeerTasting beerTasting : user.getBeerTasting()) {
			if(beerTasting.getBeer().getName().toLowerCase().contains(searchTerm.toLowerCase())) {
				beerResults.add(beerTasting);
			}
		}
		
		for (WineTasting wineTasting : user.getWineTasting()) {
			if(wineTasting.getWine().getName().toLowerCase().contains(searchTerm.toLowerCase())) {
				wineResults.add(wineTasting);
			}
		}
		
		for (SpiritTasting spiritTasting : user.getSpiritTasting()) {
			if(spiritTasting.getSpirit().getName().toLowerCase().contains(searchTerm.toLowerCase())) {
				spiritResults.add(spiritTasting);
			}
		}
		
		model.addAttribute("beerResults", beerResults);
		model.addAttribute("wineResults", wineResults);
		model.addAttribute("spiritResults", spiritResults);
		
		return "results";
	}
	
	
	
//	@RequestMapping("profile.do")
//	public String viewProfile(Model model, User user, HttpSession session) {
//		
//	}

}
