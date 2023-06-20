//package com.example.beauty.controllers;
//
//import com.example.beauty.models.User;
//import com.example.beauty.services.UserService;
//import lombok.RequiredArgsConstructor;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//
//@Controller
//@RequiredArgsConstructor
//public class UserController {
//    private final UserService userService;
//
//    @GetMapping("/login")
//    public String login() {
//        return "login";
//    }
//
//    @GetMapping("/registration")
//    public String registration() {
//        return "registration";
//    }
//
//
//    @PostMapping("/registration")
//    public String createUser(User user, Model model) {
//        if (!userService.createUser(user)) {
//            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
//            return "registration";
//        }
//        return "redirect:/login";
//    }
//
//    @GetMapping("/user/{user}")
//    public String userInfo(@PathVariable("user") User user, Model model) {
//        model.addAttribute("user", user);
//        model.addAttribute("products", user.getProducts());
//        return "user-info";
//    }
//}
package com.example.beauty.controllers;
import com.example.beauty.models.User;
import com.example.beauty.services.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.security.Principal;

@Controller
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;


    @GetMapping("/login")
    public String login(Principal principal, Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        return "login";
    }

    @GetMapping("/profile")
    public String profile(Principal principal,
                          Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        return "profile";
    }

    @GetMapping("/registration")
    public String registration(User user,Model model) {
        model.addAttribute("user", user);
        return "registration";
    }


    @PostMapping("/registration")
    public String createUser(User user, Model model) {
        if (!userService.createUser(user)) {
            model.addAttribute("errorMessage", "Пользователь с email: " + user.getEmail() + " уже существует");
            return "registration";
        }
        return "redirect:/login";
    }

    @GetMapping("/user/{user}")
    public String userInfo(@PathVariable("user") User user, Model model, Principal principal) {
        model.addAttribute("user", user);
        model.addAttribute("userByPrincipal", userService.getUserByPrincipal(principal));
        model.addAttribute("products", user.getProducts());
        return "user-info";
    }

}
