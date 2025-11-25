package com.example.vehicleservice.repository;

import com.example.vehicleservice.model.Vehicle;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface VehicleRepository extends JpaRepository<Vehicle, Long> {
     List<Vehicle> findByUserId(Long userId);
}
