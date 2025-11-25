package com.example.vehicleservice.dto;

import com.example.vehicleservice.model.Feedback;
import com.example.vehicleservice.model.User;
import com.example.vehicleservice.model.Vehicle;

import java.util.List;

public class InitDataRequest {
    private List<User> users;
    private List<Vehicle> vehicles;
    private List<Feedback> feedbacks;

    // ✅ Add getters and setters!
    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public List<Vehicle> getVehicles() {
        return vehicles;
    }

    public void setVehicles(List<Vehicle> vehicles) {
        this.vehicles = vehicles;
    }

    public List<Feedback> getFeedbacks() {
        return feedbacks;
    }

    public void setFeedbacks(List<Feedback> feedbacks) {
        this.feedbacks = feedbacks;
    }
}
