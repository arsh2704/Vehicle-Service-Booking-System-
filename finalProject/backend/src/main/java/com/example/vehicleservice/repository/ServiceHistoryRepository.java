package com.example.vehicleservice.repository;

import com.example.vehicleservice.model.ServiceHistory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceHistoryRepository extends JpaRepository<ServiceHistory, Long> {
}
