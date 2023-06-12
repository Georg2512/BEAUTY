package com.example.beauty.controllers;

import com.example.beauty.models.Product;
import com.example.beauty.models.User;
import com.example.beauty.models.Zakaz;
import com.example.beauty.services.ProductService;
import com.example.beauty.services.ZakazService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;


@Controller
@RequiredArgsConstructor
public class ZakazController {
    private final ZakazService zakazService;

    @GetMapping("/my/zakaz")
    public String zakaz(User user,Model model,Principal principal) {
        model.addAttribute("zakaz", zakazService.listZakaz());
        model.addAttribute("user", zakazService.getUserByPrincipal(principal));
        return "zakaz";
    }

    @GetMapping("/my/zakaz/completed")
    public String zakazCompleted(User user,Model model,Principal principal) {
        model.addAttribute("zakaz", zakazService.listZakaz());
        model.addAttribute("user", zakazService.getUserByPrincipal(principal));
        return "zakazCompleted";
    }

    @GetMapping("/my/zakaz/create")
    public String zakazCreate(Model model,Principal principal) {
        model.addAttribute("user", zakazService.getUserByPrincipal(principal));
        return "createZakaz";
    }
    @PostMapping("/zakaz/delete/{id}")
    public String deleteZakaz(@PathVariable Long id){
        zakazService.deleteZakaz(id);
        return "redirect:/my/zakaz/completed";
    }

    @PostMapping("/zakaz/update/{id}")
    public String updateZakaz(@PathVariable Long id) throws IOException {
        Zakaz zakaz = zakazService.getZakazById(id);
        zakaz.setStatus("Завершен");
        zakazService.saveZakaz(zakaz);
        return "redirect:/my/zakaz";
    }

    @PostMapping("/zakaz/exec/{id}/exec/{exec}")
    public String execZakaz(@PathVariable Long id,@PathVariable String exec) throws IOException {
        Zakaz zakaz = zakazService.getZakazById(id);
        zakaz.setExecutor(exec);
        zakazService.saveZakaz(zakaz);
        return "redirect:/my/zakaz";
    }

    @PostMapping("/zakaz/reupdate/{id}")
    public String reupdateZakaz(@PathVariable Long id) throws IOException {
        Zakaz zakaz = zakazService.getZakazById(id);
        zakaz.setStatus("Возобновлен");
        zakazService.saveZakaz(zakaz);
        return "redirect:/my/zakaz/completed";
    }


    @PostMapping("/zakaz/create")
    public String createZakaz(Zakaz zakaz) throws IOException {
        zakazService.saveZakaz(zakaz);
        return "redirect:/my/zakaz";
    }

}
