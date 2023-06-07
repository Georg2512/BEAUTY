package com.example.beauty.controllers;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import com.example.beauty.models.Zakaz;
import com.example.beauty.services.ZakazService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.IOException;
import java.security.Principal;
import java.util.Date;

@RestController

public class SimpleMailController {
    private final ZakazService zakazService;
    @Autowired
    private JavaMailSender sender;

    Date date = new Date();

    public SimpleMailController(ZakazService zakazService) {
        this.zakazService = zakazService;
    }

    @RequestMapping("/sendMail")
    public String sendMail(Principal principal, Zakaz zakaz) {
        MimeMessage message = sender.createMimeMessage();
        MimeMessageHelper helper = new MimeMessageHelper(message);
        try {
            String email = principal.getName();
            helper.setTo("gg@s24volga.ru");
            helper.setText("Запись от " + date);
            helper.setSubject("Клиент с почтой " + email + " записался на ");
            zakaz.setValue(email);
            zakaz.setDate("TEst");
            zakaz.getDateOfCreated();
            zakaz.setStatus("Создан");
            zakazService.saveZakaz(zakaz,principal);
        } catch (MessagingException | IOException e) {
            e.printStackTrace();
            return "Error while sending mail ..";
        }
        sender.send(message);
        return "Администратор будет уведомлен о вашей записи!";
    }
}