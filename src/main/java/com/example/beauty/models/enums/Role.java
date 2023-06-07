package com.example.beauty.models.enums;

import org.springframework.security.core.GrantedAuthority;

public enum Role implements GrantedAuthority {
    ROLE_USER, ROLE_ADMIN, ROLE_MANAGE;

    @Override
    public String getAuthority() {
        return name();
    }
}
