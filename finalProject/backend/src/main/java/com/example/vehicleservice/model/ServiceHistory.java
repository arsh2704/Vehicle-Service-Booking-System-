package com.example.vehicleservice.model;

import jakarta.persistence.*;

@Entity
public class ServiceHistory {
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String description;
    private String serviceDate;

    @OneToOne
    @JoinColumn(name = "booking_id")
    private Booking booking;
}
