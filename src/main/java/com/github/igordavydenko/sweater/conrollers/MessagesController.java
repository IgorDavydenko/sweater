package com.github.igordavydenko.sweater.conrollers;

import com.github.igordavydenko.sweater.domain.Message;
import com.github.igordavydenko.sweater.domain.User;
import com.github.igordavydenko.sweater.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Controller
public class MessagesController {

    @Autowired
    private MessageRepo messageRepo;

    @Value("${upload.path}")
    private String uploadFilePath;

    @GetMapping("/")
    public String helloPage() {
        return "greeting";
    }

    @GetMapping("/index")
    public String indexPage(
            @RequestParam(required = false) String filter,
            Model model) {

        Iterable<Message> messages;
        if (filter != null && !filter.isEmpty()) {
            messages = messageRepo.findByTag(filter);
        } else  {
            messages = messageRepo.findAll();
        }

        model.addAttribute("messages", messages);
        model.addAttribute("filter", filter);

        return "index";
    }

//    @GetMapping("/filter")
//    public String filterMessage(@RequestParam String filter, Model model) {
//        Iterable<Message> messages;
//        if (filter != null && !filter.isEmpty()) {
//            messages = messageRepo.findByTag(filter);
//        } else  {
//            messages = messageRepo.findAll();
//        }
//        model.addAttribute("messages", messages);
//
//        return "index";
//    }

    @PostMapping("/index")
    public String addMessage(
            @AuthenticationPrincipal User user,
            @RequestParam String message,
            @RequestParam String tag,
            @RequestParam("file") MultipartFile file,
            Model model) throws IOException {

        if (message != null && !message.isEmpty()) {
            Message newMessage = new Message(message, tag, user);

            if (file != null) {
                File uploadDir = new File(uploadFilePath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                String resultFileName = UUID.randomUUID().toString() + "." + file.getOriginalFilename();
                file.transferTo(new File(uploadFilePath + "/" + resultFileName));
                newMessage.setFileName(resultFileName);
            }

            messageRepo.save(newMessage);
        }

        model.addAttribute("messages", messageRepo.findAll());
        return "index";
    }

}
