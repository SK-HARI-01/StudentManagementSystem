package com.example.SBDemoPrg;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.boot.builder.SpringApplicationBuilder;

@SpringBootApplication
public class SbDemoPrgApplication extends SpringBootServletInitializer {
	@Override
	protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
		return application.sources(SbDemoPrgApplication.class);
	}

	public static void main(String[] args) {
		SpringApplication.run(SbDemoPrgApplication.class, args);
	}
}
