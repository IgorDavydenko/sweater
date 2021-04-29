package com.github.igordavydenko.sweater.conrollers;

import com.github.igordavydenko.sweater.domain.Message;
import com.github.igordavydenko.sweater.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MessagesController {

    @Autowired
    private MessageRepo messageRepo;

    @GetMapping("/")
    public String helloPage() {
        return "greeting";
    }

    @GetMapping("/index")
    public String indexPage(Model model) {
        model.addAttribute("messages", messageRepo.findAll());
        return "index";
    }

    @GetMapping("/filter")
    public String filterMessage(@RequestParam String filter, Model model) {
        Iterable<Message> messages;
        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else  {
            messages = messageRepo.findAll();
        }
        model.addAttribute("messages", messages);

        return "index";
    }

    @PostMapping("/index")
    public String addMessage(@RequestParam String message, @RequestParam String tag, Model model) {
        if (message != null && !message.isEmpty()) {
            messageRepo.save(new Message(message, tag));
        }

        model.addAttribute("messages", messageRepo.findAll());
        return "index";
    }

}
