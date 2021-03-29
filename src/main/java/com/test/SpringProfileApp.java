package com.test;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringProfileApp {

	private static final Logger logger = LogManager.getLogger(SpringProfileApp.class.getSimpleName());

	public static void main(String[] args) {
		SpringApplication.run(SpringProfileApp.class, args);
		logger.info("Springboot application is running successfully.");
	}
}
