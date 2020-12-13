package com.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.core.env.Environment;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class SpringProfileApp {

    private static Logger LOGGER = LoggerFactory.getLogger(SpringProfileApp.class);

    @Autowired
    private Environment env;

    @RestController
    class HelloworldController {

        @GetMapping("/")
        public String helloSpringProfile() {
            String s1 = env.getProperty("app.message");
            String s2 = env.getProperty("app.message");

            System.out.println("----->" + s1);
            System.out.println("----->" + s2);

            return env.getProperty("app.message");
        }
    }

    public static void main(String[] args) {
        SpringApplication.run(SpringProfileApp.class, args);
        LOGGER.info("Springboot profiles application is running successfully.");
    }
}
