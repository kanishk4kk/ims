package com.sysquare.ims.web.ui.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sysquare.ims.core.service.UserService;
import com.sysquare.ims.model.domain.User;

@Controller
public class LoginController {
    
    private static final Logger log = Logger.getLogger(LoginController.class);

	@Autowired
	private UserService userService;
	
	@RequestMapping("/login")
	public void listUsers(Map<String, Object> map) {
		//System.out.println("/login");
	}
	
	@RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
	    request.getSession().invalidate();
	    return "redirect:/login.html";
    }
	@RequestMapping(value = "/inValidMachine", method = RequestMethod.GET)
    public void inValidMachine() {
	    System.out.println("test");
    }

	@RequestMapping(value = "/login", method = RequestMethod.POST)
    public String loginValidate(@RequestParam(required=true,value="j_username") String j_username, @RequestParam(required=true,value="j_password") String j_password, HttpServletRequest request) {
		System.out.println("Login:"+j_username);
	    log.info("User logged in :" + j_username);
	    User user = userService.findByEmailAndPassword(j_username, j_password);
	    if(user == null) {
	        return "redirect:/login.html?invalidLogin=Y";
	    } else {
	        request.getSession().setAttribute("loggedInUser", user);
//	        return "redirect:/registration/create.html";
	        return "redirect:/master/add.html";
	    }
	}
}
