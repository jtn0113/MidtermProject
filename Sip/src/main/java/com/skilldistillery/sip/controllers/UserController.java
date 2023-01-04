package com.skilldistillery.sip.controllers;

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

}
