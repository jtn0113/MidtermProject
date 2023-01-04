package com.skilldistillery.sip.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.sip.data.UserDAO;
import com.skilldistillery.sip.entities.User;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		
		return "home";
	}

	@RequestMapping("register.do")
	public String register() {
		
		return "register";
	}
	
//	@RequestMapping(path = {"createUser.do"}, method = RequestMethod.POST)
	@RequestMapping("createUser.do")
	public String createUser(User user, Model model) {
		userDao.create(user);
		model.addAttribute("user", user);
		return "home";
	}
//	GET login.do displays the login view.
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String goToLogin(HttpSession session) {
		if (session.getAttribute("loggedInUser") == null) {
			return "login";
		}
		else {
			return "home";
		}
	}

//	POST login.do attempts to log in the user by retrieving it from the DAO (use a User command object parameter).
// session.setAttribute("loggedInUser", user);
//	If the userName and password match the DAO data, load the User object into session, and return the account view.

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(User user, HttpSession session) {
		User validatedUser = userDao.findUsernameAndPassword(user.getUsername(), user.getPassword());
		if (validatedUser == null) {
			return "login";
		} else {
			session.setAttribute("loggedInUser", validatedUser);
			return "home";
		}
	}
//	If the login fails, display the login view.

//	logout.do removes the user from session and returns the index.
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loggedInUser");
		return "login";
	}

}

