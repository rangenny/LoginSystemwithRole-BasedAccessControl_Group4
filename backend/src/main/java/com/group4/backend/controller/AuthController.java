package com.group4.backend.controller;

import org.springframework.web.bind.annotation.*;
import java.util.Map;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "http://localhost:4200")
public class AuthController {

    @PostMapping("/login")
    public Map<String, String> login(@RequestBody Map<String, String> credentials) {
        String username = credentials.get("username");
        String password = credentials.get("password");

        // Check if Admin
        if ("admin".equals(username) && "admin123".equals(password)) {
            return Map.of(
                    "token", "fake-jwt-admin-token",
                    "role", "ADMIN",
                    "message", "Login successful");
        }
        // Check if Regular User
        else if ("user".equals(username) && "user123".equals(password)) {
            return Map.of(
                    "token", "fake-jwt-user-token",
                    "role", "USER",
                    "message", "Login successful");
        }

        throw new RuntimeException("Invalid credentials");
    }
}