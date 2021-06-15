package com.test;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloKubernetes {

	@Value("${app.message}")
	private String message;

	@RequestMapping("/")
	public String index() {

		return message;
	}
}
