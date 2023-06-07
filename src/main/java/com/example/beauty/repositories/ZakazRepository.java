package com.example.beauty.repositories;

import com.example.beauty.models.Product;
import com.example.beauty.models.Zakaz;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ZakazRepository extends JpaRepository<Zakaz, Long> {
    List<Zakaz> findByValue(String value);

    @Override
    void deleteById(Long a);
}
