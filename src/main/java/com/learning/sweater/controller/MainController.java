package com.learning.sweater.controller;

import com.learning.sweater.domain.Message;
import com.learning.sweater.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class MainController {

    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String greeting(Map<String, Object> model) {
        return "greeting";
    }

    @GetMapping("/main")
    public String main(Map<String, Object> model) {
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "main";
    }

    @PostMapping("/main")
    public String addMessage(
            @RequestParam String message,
            @RequestParam String tag,
            Map<String, Object> model) {
        Message newMessage = new Message(message, tag);
        messageRepo.save(newMessage);
        Iterable<Message> messages = messageRepo.findAll();
        model.put("messages", messages);
        return "main";
    }

    @PostMapping("filter")
    public String filterByMessage(
            @RequestParam String tag,
            Map<String, Object> model) {
        Iterable<Message> messages;
        if(tag != null && !tag.isEmpty()) {
            messages = messageRepo.findByTag(tag);
        } else {
            messages = messageRepo.findAll();
        }
        model.put("messages", messages);
        return "main";
    }

}
