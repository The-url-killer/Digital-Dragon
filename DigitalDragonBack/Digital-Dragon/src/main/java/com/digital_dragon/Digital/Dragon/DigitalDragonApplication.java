package com.digital_dragon.Digital.Dragon;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = {DataSourceAutoConfiguration.class })
public class DigitalDragonApplication {

	public static void main(String[] args) {
		SpringApplication.run(DigitalDragonApplication.class, args);
	}

}
