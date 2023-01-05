package com.skilldistillery.sip.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.sip.data.WineDao;
import com.skilldistillery.sip.entities.Wine;

@Controller
public class WineController {

	@Autowired
	private WineDao wineDao;
	
	@RequestMapping("wine.do")
	public String createWine(Wine wine, Model model) {
		System.out.println(wine.toString());
		wineDao.createWine(wine);
		System.out.println(wineDao.createWine(wine));
		model.addAttribute("wine", wine);
		
		return "home";
	}
	
	@RequestMapping("selectWine.do")
	public String selectWine() {
		return "wine";
	}
}
