package com.test;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Hellok8sApp {

	private static final Logger logger = LogManager.getLogger(Hellok8sApp.class.getSimpleName());

	public static void main(String[] args) {
		SpringApplication.run(Hellok8sApp.class, args);
		logger.info("Springboot application is running successfully.");
	}
}
