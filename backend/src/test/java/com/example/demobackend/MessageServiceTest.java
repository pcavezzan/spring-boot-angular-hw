package com.example.demobackend;

import org.junit.jupiter.api.Test;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.*;

class MessageServiceTest {

    private final MessageService messageService = new MessageService("Foo Bar");

    @Test
    void helloWorld() {
        assertThat(messageService.helloWorld()).isEqualTo(new Message("Foo Bar"));
    }
}