package com.example.vehicleservice.repository;

import com.example.vehicleservice.model.User;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email); // for login
    Optional<User> findByUsername(String username); // optional
}
