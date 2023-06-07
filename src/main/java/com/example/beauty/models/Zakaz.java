package com.example.beauty.models;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import org.hibernate.Hibernate;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
@Entity
@Table(name = "zakaz")
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class Zakaz {
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        private String value;
        private String status;
        @ManyToOne
        @JoinColumn(name = "user_id")
        private User user;
        private LocalDateTime dateOfCreated;
        private String date;

        @PrePersist
        private void onCreate() { dateOfCreated = LocalDateTime.now(); }


        @Override
        public boolean equals(Object o) {
            if (this == o) return true;
            if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
            com.example.beauty.models.Zakaz zakaz = (com.example.beauty.models.Zakaz) o;
            return id != null && Objects.equals(id, zakaz.id);
        }

        @Override
        public int hashCode() {
            return getClass().hashCode();
        }

}
