package com.example.beauty.repositories;

import com.example.beauty.models.Product;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> findByTitle(String title);

    @Override
    void deleteById(Long a);
}
