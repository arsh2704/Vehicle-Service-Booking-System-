// model/ServiceBooking.java
package com.example.vehicleservice.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class ServiceBooking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String customerName;
    private String vehicleNumber;
    private String serviceType;
    private LocalDate bookingDate;

    // Getters & Setters
}