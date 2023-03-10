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
		User user = (User)session.getAttribute("loggedInUser");
		if (user == null) {
			return "login";
		} else {
			model.addAttribute("friends", userDao.findFriendsForUser(user.getId()));
			
			return "home";
		}
	}

	@RequestMapping("register.do")
	public String register() {
		return "register";
	}

//	@RequestMapping(path = {"createUser.do"}, method = RequestMethod.POST)
	@RequestMapping("createUser.do")
	public String createUser(@RequestParam boolean overTwentyOne, @RequestParam String username, User user, Address address, Model model, HttpSession session) {
		//get all usernames - then check if the username they put is unique
		
		if(userDao.checkUsername().contains(username)) {
			String errorMessage = "Error: That username is already taken.";
			model.addAttribute("errorMessage", errorMessage);
			return "login";
		}
		
		else if(overTwentyOne == false) {
			String errorMessage = "Error: Must be over 21 to use this app.";
			model.addAttribute("errorMessage", errorMessage);
			return "login";			
		}
		else {			
		userDao.create(user);
		model.addAttribute("user", user);
		model.addAttribute("addr", address);
		session.setAttribute("loggedInUser", user);
		System.out.println(user.getId());
		return "home";
		}
	}

//	GET login.do displays the login view.
	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String goToLogin(HttpSession session, Model model) {
		User user = (User)session.getAttribute("loggedInUser");
		if (user == null) {
			return "login";
		} else {
			model.addAttribute("friends", userDao.findFriendsForUser(user.getId()));
			return "home";
		}
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String login(Model model, User user, HttpSession session) {
		System.out.println("********************************");
		User validatedUser = userDao.findUsernameAndPassword(user.getUsername(), user.getPassword());
		if (validatedUser == null) {
			String errorMessage = "Error: Username or password incorrect.";
			model.addAttribute("errorMessage", errorMessage);
			return "login";
		} else if (validatedUser.getEnabled() != true) {
			String errorMessage = "Error: Account has been disabled.";
			model.addAttribute("errorMessage", errorMessage);
			return "login";
		}
		else {
			session.setAttribute("loggedInUser", validatedUser);
			//List<User> friends =  validatedUser.getFollowing();
			model.addAttribute("friends", userDao.findFriendsForUser(validatedUser.getId()));
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
		model.addAttribute("friends", userDao.findFriendsForUser(editUser.getId()));
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
	
	@RequestMapping("friends.do")
	public String friendsList(Model model, HttpSession session) {
		User user = (User) session.getAttribute("loggedInUser");
		System.out.println("***********"+user);
		model.addAttribute("friends", userDao.findFriendsForUser(user.getId()));
		return "friends";
	}
	
	@RequestMapping("manageUsers.do")
	public String manageUsers(HttpSession session, Model model) {
	
		
		User user = (User) session.getAttribute("loggedInUser");
		if (user.getRole().equals("ADMIN")) {
			List<User> activeUsers = userDao.findActiveAccounts();
			List<User> deactivatedUsers = userDao.findDeactivatedAccounts();
			model.addAttribute("activeUsers", activeUsers);
			model.addAttribute("deactivatedUsers", deactivatedUsers);
			return "manageUsers";
		} else {
			
			return "home";
		}
		
		
	}
	
	@RequestMapping("deactivate.do")
	public String deactivateUser(@RequestParam int id, Model model) {
		userDao.deactivated(id);
		List<User> activeUsers = userDao.findActiveAccounts();
		List<User> deactivatedUsers = userDao.findDeactivatedAccounts();
		model.addAttribute("activeUsers", activeUsers);
		model.addAttribute("deactivatedUsers", deactivatedUsers);
		return "manageUsers";
		
	}
	@RequestMapping("activate.do")
	public String activateUser(@RequestParam int id, Model model) {
		userDao.activateAccount(id);
		List<User> activeUsers = userDao.findActiveAccounts();
		List<User> deactivatedUsers = userDao.findDeactivatedAccounts();
		model.addAttribute("activeUsers", activeUsers);
		model.addAttribute("deactivatedUsers", deactivatedUsers);
		return "manageUsers";
		
	}

	@RequestMapping("addFriend.do")
	public String addFriend(@RequestParam String searchFriend, HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		if(userDao.addFriendToUser(searchFriend, user) == false) {
			String errorMessage = "You are already following " + searchFriend;
			model.addAttribute("errorMessage", errorMessage);
		} else if(userDao.findFriendByUsername(searchFriend) == null) {
			String errorMessage = searchFriend + " does not exist";
			model.addAttribute("errorMessage", errorMessage);
		}
		model.addAttribute("friends", userDao.findFriendsForUser(user.getId()));
		return "friends";
	}
	
	@RequestMapping("deleteFriend.do")
	public String deleteFriend(@RequestParam int friendId, HttpSession session, Model model) {
		User user = (User) session.getAttribute("loggedInUser");
		User friend = userDao.findById(friendId);
		userDao.removeFriendFromUser(friendId, user);
		String errorMessage = friend.getUsername() + " deleted from friends";
		model.addAttribute("friends", userDao.findFriendsForUser(user.getId()));
		model.addAttribute("errorMessage", errorMessage);
		return "friends";
	}
	
}
