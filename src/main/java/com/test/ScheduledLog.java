package com.test;

import java.time.LocalDateTime;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class ScheduledLog {
	private static final Logger logger = LogManager.getLogger(ScheduledLog.class.getSimpleName());

	@Scheduled(fixedRate = 1000)
	public void reportCurrentTime() {

		/*
		 * System.out.println("Sysout Msg" + "The time now is {}" +
		 * LocalDateTime.now());
		 * 
		 * logger.info("Logger Msg" +"The time now is {}", LocalDateTime.now());
		 */
	}
}