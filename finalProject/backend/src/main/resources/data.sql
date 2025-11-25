-- Insert Users
INSERT INTO user (id, name, email) VALUES (1, 'Dhruv Suthar', 'dhruv@example.com');
INSERT INTO user (id, name, email) VALUES (2, 'Ashish Sharma', 'ashish@example.com');
INSERT INTO user (id, name, email) VALUES (3, 'Vishakha Mehta', 'vishakha@example.com');

-- Insert Vehicles
INSERT INTO vehicle (id, make, model, user_id) VALUES (1, 'Honda', 'Civic', 1);
INSERT INTO vehicle (id, make, model, user_id) VALUES (2, 'Toyota', 'Corolla', 1);
INSERT INTO vehicle (id, make, model, user_id) VALUES (3, 'Hyundai', 'i20', 2);

-- Insert Feedback
INSERT INTO feedback (id, message, user_id) VALUES (1, 'Great service!', 1);
INSERT INTO feedback (id, message, user_id) VALUES (2, 'Quick response!', 2);
