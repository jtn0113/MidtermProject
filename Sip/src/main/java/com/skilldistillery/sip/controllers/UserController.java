package com.skilldistillery.sip.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.sip.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDao;
	
}
