package com.skilldistillery.sip.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.sip.data.UserDAO;
import com.skilldistillery.sip.entities.Address;
import com.skilldistillery.sip.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

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
		return "account";
	}
	
	@RequestMapping("editInformation.do")
	public String editInformation(Model model, User user, HttpSession session) {
		model.addAttribute("loggedInUser", user);
		return "home";
	
	}
	
}
