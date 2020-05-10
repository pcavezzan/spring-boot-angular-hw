package com.example.demobackend;

import lombok.AllArgsConstructor;
import lombok.Data;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@SpringBootApplication
public class DemoBackendApplication {

	@Value("${demo.messages.helloWorld}")
	private String helloWorldMsg;

	public static void main(String[] args) {
		SpringApplication.run(DemoBackendApplication.class, args);
	}

	@Bean
	public MessageService messageService() {
		return new MessageService(helloWorldMsg);
	}
}

@RestController
@RequestMapping("/message")
class MessageResource {

	@Autowired
	private MessageService messageService;

	@GetMapping
	public Message get() {
		return messageService.helloWorld();
	}

}

@AllArgsConstructor
class MessageService {

	private final String helloWorldMsg;

	public Message helloWorld() {
		return new Message(helloWorldMsg);
	}

}

@Data
class Message {
	private final String payload;
}
