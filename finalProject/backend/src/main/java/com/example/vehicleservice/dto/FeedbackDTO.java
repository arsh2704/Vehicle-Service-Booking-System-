package com.example.vehicleservice.dto;

import com.example.vehicleservice.model.Feedback;

public class FeedbackDTO {
    private Long id;
    private String comments;
    private int rating;
    private Long customerId;
    private String customerUsername;

    public FeedbackDTO(Feedback f) {
        this.id = f.getId();
        this.comments = f.getComment();
        this.rating = f.getRating();
        this.customerId = f.getCustomer().getId();
        this.customerUsername = f.getCustomer().getUsername();
    }
}
