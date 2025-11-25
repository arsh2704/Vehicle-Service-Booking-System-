-- Sample data for Vehicle Service Booking System

USE vehicle_service_db;

-- Insert sample users (password is 'password123' hashed with BCrypt)
INSERT INTO users (username, email, password, first_name, last_name, phone, role) VALUES
('admin', 'admin@vehicleservice.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Admin', 'User', '+1234567890', 'ADMIN'),
('john.doe', 'john.doe@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'John', 'Doe', '+1234567891', 'CUSTOMER'),
('jane.smith', 'jane.smith@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Jane', 'Smith', '+1234567892', 'CUSTOMER'),
('mike.johnson', 'mike.johnson@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Mike', 'Johnson', '+1234567893', 'CUSTOMER'),
('sarah.wilson', 'sarah.wilson@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Sarah', 'Wilson', '+1234567894', 'CUSTOMER'),
('mechanic1', 'mechanic1@vehicleservice.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Tom', 'Anderson', '+1234567895', 'MECHANIC'),
('mechanic2', 'mechanic2@vehicleservice.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'David', 'Brown', '+1234567896', 'MECHANIC'),
('mechanic3', 'mechanic3@vehicleservice.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOsl7iKTVEFDa', 'Lisa', 'Garcia', '+1234567897', 'MECHANIC');

-- Insert sample vehicles
INSERT INTO vehicles (user_id, make, model, year, license_plate, vin, color, mileage) VALUES
(2, 'Toyota', 'Camry', 2020, 'ABC123', '1HGBH41JXMN109186', 'Silver', 25000),
(2, 'Honda', 'CR-V', 2019, 'XYZ789', '2T1BURHE0JC123456', 'Blue', 35000),
(3, 'Ford', 'F-150', 2021, 'DEF456', '3VWDX7AJ5DM123456', 'Red', 15000),
(4, 'BMW', 'X5', 2020, 'GHI789', '4T1B11HK5JU123456', 'Black', 22000),
(5, 'Mercedes', 'C-Class', 2021, 'JKL012', '5NPE34AF5FH123456', 'White', 18000);

-- Insert service types
INSERT INTO service_types (name, description, estimated_duration, base_price) VALUES
('Oil Change', 'Complete oil change with filter replacement', 60, 45.00),
('Brake Service', 'Brake pad replacement and brake fluid check', 120, 150.00),
('Tire Rotation', 'Tire rotation and balance', 45, 35.00),
('Air Filter Replacement', 'Engine and cabin air filter replacement', 30, 25.00),
('Battery Replacement', 'Battery replacement and testing', 45, 120.00),
('Spark Plug Replacement', 'Spark plug replacement and inspection', 90, 80.00),
('Transmission Service', 'Transmission fluid change and inspection', 120, 200.00),
('Coolant System Service', 'Coolant flush and system inspection', 90, 100.00),
('Fuel System Cleaning', 'Fuel injector cleaning and system inspection', 120, 150.00),
('Electrical System Check', 'Complete electrical system diagnosis', 60, 75.00),
('AC System Service', 'AC system check and refrigerant top-up', 90, 120.00),
('Suspension Inspection', 'Suspension system inspection and alignment', 120, 180.00);

-- Insert sample service slots for mechanics
INSERT INTO service_slots (mechanic_id, date, start_time, end_time, is_available) VALUES
-- Mechanic 1 slots for next week
(6, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '09:00:00', '10:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '10:00:00', '11:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '11:00:00', '12:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '13:00:00', '14:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:00:00', '15:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '15:00:00', '16:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '09:00:00', '10:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '10:00:00', '11:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '11:00:00', '12:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '13:00:00', '14:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '14:00:00', '15:00:00', TRUE),
(6, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '15:00:00', '16:00:00', TRUE),

-- Mechanic 2 slots
(7, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '09:00:00', '10:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '10:00:00', '11:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '11:00:00', '12:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '13:00:00', '14:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:00:00', '15:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '15:00:00', '16:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '09:00:00', '10:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '10:00:00', '11:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '11:00:00', '12:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '13:00:00', '14:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '14:00:00', '15:00:00', TRUE),
(7, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '15:00:00', '16:00:00', TRUE),

-- Mechanic 3 slots
(8, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '09:00:00', '10:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '10:00:00', '11:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '11:00:00', '12:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '13:00:00', '14:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '14:00:00', '15:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '15:00:00', '16:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '09:00:00', '10:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '10:00:00', '11:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '11:00:00', '12:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '13:00:00', '14:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '14:00:00', '15:00:00', TRUE),
(8, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '15:00:00', '16:00:00', TRUE);

-- Insert sample bookings
INSERT INTO bookings (customer_id, vehicle_id, service_type_id, mechanic_id, slot_id, booking_date, preferred_time, status, total_price, notes) VALUES
(2, 1, 1, 6, 1, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '09:00:00', 'CONFIRMED', 45.00, 'Regular oil change needed'),
(3, 3, 2, 7, 13, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '09:00:00', 'CONFIRMED', 150.00, 'Brake pads making noise'),
(4, 4, 3, 8, 25, DATE_ADD(CURDATE(), INTERVAL 1 DAY), '09:00:00', 'CONFIRMED', 35.00, 'Tire rotation due'),
(5, 5, 5, 6, 7, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '09:00:00', 'PENDING', 120.00, 'Battery not holding charge'),
(2, 2, 4, 7, 19, DATE_ADD(CURDATE(), INTERVAL 2 DAY), '10:00:00', 'PENDING', 25.00, 'Air filter replacement');

-- Insert sample service history
INSERT INTO service_history (booking_id, mechanic_id, service_date, start_time, end_time, work_description, parts_used, labor_hours, total_cost, status) VALUES
(1, 6, DATE_ADD(CURDATE(), INTERVAL -1 DAY), '09:00:00', '10:00:00', 'Completed oil change with filter replacement', 'Oil filter, 5W-30 oil', 1.0, 45.00, 'COMPLETED'),
(2, 7, DATE_ADD(CURDATE(), INTERVAL -2 DAY), '09:00:00', '11:00:00', 'Replaced brake pads and checked brake fluid', 'Brake pads, brake fluid', 2.0, 150.00, 'COMPLETED'),
(3, 8, DATE_ADD(CURDATE(), INTERVAL -3 DAY), '09:00:00', '09:45:00', 'Completed tire rotation and balance', 'None', 0.75, 35.00, 'COMPLETED');

-- Insert sample feedback
INSERT INTO feedback (booking_id, customer_id, mechanic_id, rating, comment, is_public) VALUES
(1, 2, 6, 5, 'Excellent service! Very professional and quick.', TRUE),
(2, 3, 7, 4, 'Good work on the brakes. Car feels much better now.', TRUE),
(3, 4, 8, 5, 'Fast and efficient tire rotation service.', TRUE);

-- Insert sample notifications
INSERT INTO notifications (user_id, title, message, type) VALUES
(2, 'Booking Confirmed', 'Your oil change appointment for tomorrow at 9:00 AM has been confirmed.', 'BOOKING_CONFIRMATION'),
(3, 'Service Reminder', 'Your brake service appointment is scheduled for tomorrow at 9:00 AM.', 'BOOKING_REMINDER'),
(4, 'Service Completed', 'Your tire rotation service has been completed. Please pick up your vehicle.', 'SERVICE_COMPLETION'),
(5, 'Feedback Request', 'How was your recent service experience? Please provide your feedback.', 'FEEDBACK_REQUEST'),
(6, 'New Assignment', 'You have been assigned a new service booking for tomorrow.', 'SYSTEM'),
(7, 'New Assignment', 'You have been assigned a new service booking for tomorrow.', 'SYSTEM'); 