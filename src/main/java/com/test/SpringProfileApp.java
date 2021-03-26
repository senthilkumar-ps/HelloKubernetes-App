package com.test;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class SpringProfileApp {

	private static final Logger logger = LogManager.getLogger(SpringProfileApp.class.getSimpleName());



	/*
	 * @Autowired private Environment env;
	 * 
	 * @RestController class HelloworldController {
	 * 
	 * @GetMapping("/") public String helloSpringProfile() {
	 * 
	 * return env.getProperty("app.message"); } }
	 */

	public static void main(String[] args) {
		SpringApplication.run(SpringProfileApp.class, args);
		logger.info("Springboot profiles application is running successfully.");
		logger.info("Info level log message");
		logger.debug("Debug level log message");
		logger.error("Error level log message");
	}
}
