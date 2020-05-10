package com.example.demobackend;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import static org.assertj.core.api.Assertions.assertThat;

@SpringBootTest
class DemoBackendApplicationTests {

	@Autowired
	private MessageService messageService;

	@Test
	void contextLoads() {
	}

	@Test
	void messageServiceShouldReturnHelloWorld() {
		assertThat(messageService.helloWorld()).isEqualTo(new Message("Hello World"));
	}
}
