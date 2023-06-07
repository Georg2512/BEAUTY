package com.example.beauty.services;

import com.example.beauty.models.Image;
import com.example.beauty.models.Product;
import com.example.beauty.models.User;
import com.example.beauty.models.Zakaz;
import com.example.beauty.repositories.ProductRepository;
import com.example.beauty.repositories.UserRepository;
import com.example.beauty.repositories.ZakazRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Service
@Slf4j
@RequiredArgsConstructor
public class ZakazService {
    private final ZakazRepository zakazRepository;
    private final UserRepository userRepository;

    public List<Zakaz> listZakaz() {
        return zakazRepository.findAll();
    }

    public void saveZakaz(Zakaz zakaz,Principal principal) throws IOException {
        zakaz.setUser(getUserByPrincipal(principal));
        zakazRepository.save(zakaz);
    }

    public User getUserByPrincipal(Principal principal) {
        if (principal == null) return new User();
        return userRepository.findByEmail(principal.getName());
    }

    @Modifying
    public void deleteZakaz(Long id) {
        zakazRepository.deleteById(id);
    }

    public Zakaz getZakazById(Long id) {
        return zakazRepository.findById(id).orElse(null);
    }
}
