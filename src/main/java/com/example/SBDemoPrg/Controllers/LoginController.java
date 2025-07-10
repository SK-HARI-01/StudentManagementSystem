package com.example.SBDemoPrg.Controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.SBDemoPrg.Entity.LoginDetailsEntity;
import com.example.SBDemoPrg.Repository.LoginRepo;



@Controller
@RequestMapping("/login")
public class LoginController {
	 
	@Autowired
	private LoginRepo loginrepo;
	
	@GetMapping
	public String loginpage() {
		return "LoginPage";
	}
	
	@GetMapping("/get-login-details")
	public String getlogindetails(
			@RequestParam String uname,
			@RequestParam String password,
			Model model) {
		LoginDetailsEntity logininfo = loginrepo.findByusername(uname);
		if(logininfo != null && logininfo.getPassword().equals(password))
		{
			return "StdHomePage";
		}
		return "ErrorPage";
	}
	
	@PostMapping("/save-signup-details")
	public String savesignupdetails(
			@RequestParam String email,
			@RequestParam String username,
			@RequestParam String password,
			Model model) {
		LoginDetailsEntity logindetail = new LoginDetailsEntity(username,email,password);
		loginrepo.save(logindetail);
		return "LoginPage";
	}
}
