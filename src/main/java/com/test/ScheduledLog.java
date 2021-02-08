package com.test;

import java.time.LocalDateTime;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class ScheduledLog {
	private static final Logger LOGGER = LoggerFactory.getLogger(ScheduledLog.class);
	@Scheduled(fixedRate = 1000)
	public void reportCurrentTime() {
		LOGGER.info("The time now is {}", LocalDateTime.now());
	}
}