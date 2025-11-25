package com.example.vehicleservice.repository;

import com.example.vehicleservice.model.Feedback;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

public interface FeedbackRepository extends JpaRepository<Feedback, Long> {
       List<Feedback> findByCustomerId(Long customerId);
}
