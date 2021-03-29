package com.test;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloKubernetes {

	@RequestMapping("/")
	public String index() {
		return "Hello Kubernetes..!";
	}
}
