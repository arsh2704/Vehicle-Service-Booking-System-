package com.example.vehicleservice.controller;

import com.example.vehicleservice.dto.InitDataRequest;
import com.example.vehicleservice.model.*;
import com.example.vehicleservice.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api")
public class ApiController {

    @Autowired private UserRepository userRepository;
    @Autowired private VehicleRepository vehicleRepository;
    @Autowired private ServiceTypeRepository serviceTypeRepository;
    @Autowired private BookingRepository bookingRepository;
    @Autowired private ServiceHistoryRepository serviceHistoryRepository;
    @Autowired private FeedbackRepository feedbackRepository;
    @Autowired private ServiceSlotRepository serviceSlotRepository;

    // === USER ===
    @PostMapping("/users")
    public User createUser(@RequestBody User user) {
        return userRepository.save(user);
    }

    @GetMapping("/users")
    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    @GetMapping("/users/{id}")
    public ResponseEntity<User> getUserById(@PathVariable Long id) {
        return userRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // === VEHICLE ===
    @PostMapping("/vehicles")
    public ResponseEntity<Vehicle> createVehicle(@RequestBody Vehicle vehicle) {
        if (vehicle.getUser() == null || vehicle.getUser().getId() == null) {
            return ResponseEntity.badRequest().build();
        }
        User existingUser = userRepository.findById(vehicle.getUser().getId()).orElse(null);
        if (existingUser == null) {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(null);
        }
        vehicle.setUser(existingUser);
        Vehicle savedVehicle = vehicleRepository.save(vehicle);
        return ResponseEntity.ok(savedVehicle);
    }

    @GetMapping("/vehicles")
    public List<Vehicle> getAllVehicles() {
        return vehicleRepository.findAll();
    }

    @GetMapping("/vehicles/{id}")
    public ResponseEntity<Vehicle> getVehicleById(@PathVariable Long id) {
        return vehicleRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    @CrossOrigin(origins = "http://127.0.0.1:5501")
@GetMapping("/dashboard")
public ResponseEntity<?> getDashboard(@RequestParam Long userId) {
    User user = userRepository.findById(userId).orElseThrow();

    Map<String, Object> response = new HashMap<>();

    if ("ADMIN".equalsIgnoreCase(user.getRole())) {
        response.put("users", userRepository.findAll());
        response.put("vehicles", vehicleRepository.findAll());
        response.put("feedbacks", feedbackRepository.findAll());
    } else {
        response.put("vehicles", vehicleRepository.findByUserId(userId));
        response.put("feedbacks", feedbackRepository.findByCustomerId(userId));
    }

    return ResponseEntity.ok(response);
}





@PostMapping("/init")
public ResponseEntity<String> initializeData(@RequestBody InitDataRequest initData) {

    // 1. Save users first
    List<User> savedUsers = userRepository.saveAll(initData.getUsers());

    // 2. Save vehicles (with user references by id)
    for (Vehicle v : initData.getVehicles()) {
        if (v.getUser() != null && v.getUser().getId() != null) {
            User user = userRepository.findById(v.getUser().getId()).orElse(null);
            if (user != null) {
                v.setUser(user);
            }
        }
    }
    vehicleRepository.saveAll(initData.getVehicles());

    // 3. Save feedbacks (with user references)
    // 3. Save feedbacks (with user references)
// 3. Save feedbacks (booking, customer, mechanic must not be null)
for (Feedback f : initData.getFeedbacks()) {
    if (f.getBooking() != null && f.getBooking().getId() != null) {
        Booking booking = bookingRepository.findById(f.getBooking().getId()).orElse(null);
        f.setBooking(booking);
    }

    if (f.getCustomer() != null && f.getCustomer().getId() != null) {
        User customer = userRepository.findById(f.getCustomer().getId()).orElse(null);
        f.setCustomer(customer);
    }

    if (f.getMechanic() != null && f.getMechanic().getId() != null) {
        User mechanic = userRepository.findById(f.getMechanic().getId()).orElse(null);
        f.setMechanic(mechanic);
    }
}
feedbackRepository.saveAll(initData.getFeedbacks());



    return ResponseEntity.ok("Data initialized successfully");
}



    // === SERVICE TYPE ===
    @PostMapping("/servicetypes")
    public ServiceType createServiceType(@RequestBody ServiceType serviceType) {
        return serviceTypeRepository.save(serviceType);
    }

    @GetMapping("/servicetypes")
    public List<ServiceType> getAllServiceTypes() {
        return serviceTypeRepository.findAll();
    }

    @GetMapping("/servicetypes/{id}")
    public ResponseEntity<ServiceType> getServiceTypeById(@PathVariable Long id) {
        return serviceTypeRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // === SERVICE SLOT ===
    @PostMapping("/serviceslots")
    public ServiceSlot createServiceSlot(@RequestBody ServiceSlot slot) {
        return serviceSlotRepository.save(slot);
    }

    @GetMapping("/serviceslots")
    public List<ServiceSlot> getAllServiceSlots() {
        return serviceSlotRepository.findAll();
    }

    @GetMapping("/serviceslots/{id}")
    public ResponseEntity<ServiceSlot> getServiceSlotById(@PathVariable Long id) {
        return serviceSlotRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // === BOOKING ===
    @PostMapping("/bookings")
    public Booking createBooking(@RequestBody Booking booking) {
        return bookingRepository.save(booking);
    }

    @GetMapping("/bookings")
    public List<Booking> getAllBookings() {
        return bookingRepository.findAll();
    }

    @GetMapping("/bookings/{id}")
    public ResponseEntity<Booking> getBookingById(@PathVariable Long id) {
        return bookingRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // === SERVICE HISTORY ===
    @PostMapping("/servicehistories")
    public ServiceHistory createServiceHistory(@RequestBody ServiceHistory history) {
        return serviceHistoryRepository.save(history);
    }

    @GetMapping("/servicehistories")
    public List<ServiceHistory> getAllHistories() {
        return serviceHistoryRepository.findAll();
    }

    @GetMapping("/servicehistories/{id}")
    public ResponseEntity<ServiceHistory> getServiceHistoryById(@PathVariable Long id) {
        return serviceHistoryRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }

    // === FEEDBACK ===
    @PostMapping("/feedbacks")
    public Feedback createFeedback(@RequestBody Feedback feedback) {
        return feedbackRepository.save(feedback);
    }

    @GetMapping("/feedbacks")
    public List<Feedback> getAllFeedbacks() {
        return feedbackRepository.findAll();
    }

    @GetMapping("/feedbacks/{id}")
    public ResponseEntity<Feedback> getFeedbackById(@PathVariable Long id) {
        return feedbackRepository.findById(id)
                .map(ResponseEntity::ok)
                .orElse(ResponseEntity.notFound().build());
    }
}
