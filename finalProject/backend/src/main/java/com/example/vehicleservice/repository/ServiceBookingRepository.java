// repository/ServiceBookingRepository.java
package com.example.vehicleservice.repository;

import com.example.vehicleservice.model.ServiceBooking;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ServiceBookingRepository extends JpaRepository<ServiceBooking, Long> {
}
