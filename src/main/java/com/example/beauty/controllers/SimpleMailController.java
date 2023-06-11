package com.example.beauty.controllers;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import com.example.beauty.models.Zakaz;
import com.example.beauty.services.ZakazService;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.security.Principal;
import java.util.Date;

@RestController
@AllArgsConstructor
@Data
@NoArgsConstructor
public class SimpleMailController {
    @Autowired
    private JavaMailSender sender;

    Date date = new Date();

    @RequestMapping("/sendMail")
    public String sendMail() {
        try {
            SimpleEmail email = new SimpleEmail();
            email.setHostName("smtp.mail.ru");
            email.setSmtpPort(465);
            email.setAuthenticator(new DefaultAuthenticator("sektor162s@mail.ru", "PnXR5zzvvpqvibBU7Gkk"));
            email.setSSLOnConnect(true);
            email.setFrom("sektor162s@mail.ru");
            email.setSubject("TestMail");
            email.setMsg("This is a test mail ... :-)");
            email.addTo("sektor162s@mail.ru");
            email.send();
        } catch (EmailException e) {
            throw new RuntimeException(e);
        }
        return "Администратор будет уведомлен о вашей записи!";
    }
}