package com.example.SBDemoPrg.Controllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.GetMapping;

@RestController
@RequestMapping("/users")
public class MainController {
	@GetMapping
	public String hello(){
		return "Hello from Main Controller1";
	}
	
}
