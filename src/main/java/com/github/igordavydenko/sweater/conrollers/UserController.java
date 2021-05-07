package com.github.igordavydenko.sweater.conrollers;

import com.github.igordavydenko.sweater.domain.User;
import com.github.igordavydenko.sweater.domain.UserRole;
import com.github.igordavydenko.sweater.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/users")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping
//    @Secured("ADMIN")
    public String getAllUsers(Model model) {
        model.addAttribute("users", userRepo.findAll());
        return "users";
    }

    @GetMapping("{user}")
    public String getUserInfo(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", UserRole.values());

        return "userInfo";
    }

    @PostMapping
    public String saveUserInfo(
            @RequestParam String username,
            @RequestParam Map<String, String> form,
            @RequestParam("id") User user) {

        user.setUsername(username);
        Set<String> roles = Arrays.stream(UserRole.values())
                                .map(UserRole::name)
                                .collect(Collectors.toSet());
        user.getUserRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getUserRoles().add(UserRole.valueOf(key));
            }
        }
        userRepo.save(user);

        return "redirect:/users";
    }

}
