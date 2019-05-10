package controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import service.ArticleService;
import service.UserService;
import vo.User;

@Controller
public class UserController {
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session, User user , @RequestHeader String referer) {
		session.setAttribute("loginUser", userService.loginUser(user));
		return "redirect:"+referer;
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(@RequestHeader String referer , Model model) {
		model.addAttribute("referer",referer);
		return "join";
	}

	@RequestMapping(value = "/join/user", method = RequestMethod.POST)
	public String joinUser(User user , String referer) {
		userService.joinUser(user);
		return "redirect:"+referer;
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/main";
	}

}
