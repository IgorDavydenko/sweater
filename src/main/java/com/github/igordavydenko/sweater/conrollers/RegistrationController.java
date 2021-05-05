package com.github.igordavydenko.sweater.conrollers;

import com.github.igordavydenko.sweater.domain.User;
import com.github.igordavydenko.sweater.domain.UserRole;
import com.github.igordavydenko.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Collection;
import java.util.Collections;

@Controller
public class RegistrationController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping("/registration")
    public String registrationPage() {
        return "registration";
    }

    @PostMapping("/registration")
    public String addUser(User newUser, Model model) {

        if (newUser == null
            || newUser.getUsername() == null
                || newUser.getUsername().isEmpty()
            || newUser.getPassword() == null
                || newUser.getPassword().isEmpty()) {
            model.addAttribute("message", "all fields must be filled");
            return "/registration";
        }

        User checkedUser = userRepo.findUserByUsername(newUser.getUsername());
        if (checkedUser != null) {
            model.addAttribute("message", "user already exists");
            return "/registration";
        }

        newUser.setActive(true);
        newUser.setUserRoles(Collections.singleton(UserRole.USER));
        userRepo.save(newUser);
        return "redirect:/login";
    }
}
