package com.skilldistillery.sip.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.sip.data.SpiritDao;
import com.skilldistillery.sip.entities.Spirit;

@Controller
public class SpiritController {

	@Autowired
	private SpiritDao spiritDao;

	@RequestMapping("spirit.do")
	public String createSpirit(Spirit spirit, Model model) {
		spiritDao.createSpirit(spirit);
		model.addAttribute("spirit", spirit);
		return "home";
	}
	@RequestMapping("selectSpirit.do")
	public String selectSpirit() {
		return "spirit";
	}
	

}
