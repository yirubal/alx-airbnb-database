-- seed.sql
-- Airbnb Clone - Sample Data Seeding Script
-- Author: [Your Name]
-- Repository: alx-airbnb-database

-- ===========================
-- USERS
-- ===========================
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
    (gen_random_uuid(), 'John', 'Doe', 'john@example.com', 'hashed_password1', '0911111111', 'guest'),
    (gen_random_uuid(), 'Jane', 'Smith', 'jane@example.com', 'hashed_password2', '0922222222', 'host'),
    (gen_random_uuid(), 'Mark', 'Brown', 'mark@example.com', 'hashed_password3', '0933333333', 'host'),
    (gen_random_uuid(), 'Admin', 'User', 'admin@example.com', 'hashed_admin_pass', '0944444444', 'admin');

-- ===========================
-- PROPERTIES
-- ===========================
INSERT INTO properties (property_id, host_id, name, description, location, price_per_night)
VALUES
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'jane@example.com'), 'Lake View Resort', 'A peaceful resort overlooking the lake.', 'Bishoftu, Ethiopia', 120.00),
    (gen_random_uuid(), (SELECT user_id FROM users WHERE email = 'mark@example.com'), 'Sunset Villa', 'Spacious villa with beautiful sunset views.', 'Bishoftu, Ethiopia', 200.00);

-- ===========================
-- BOOKINGS
-- ===========================
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name = 'Lake View Resort'),
     (SELECT user_id FROM users WHERE email = 'john@example.com'),
     '2025-10-01', '2025-10-05', 480.00, 'confirmed'),

    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name = 'Sunset Villa'),
     (SELECT user_id FROM users WHERE email = 'john@example.com'),
     '2025-11-10', '2025-11-12', 400.00, 'pending');

-- ===========================
-- PAYMENTS
-- ===========================
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
    (gen_random_uuid(),
     (SELECT booking_id FROM bookings WHERE status = 'confirmed'),
     480.00, 'credit_card');

-- ===========================
-- REVIEWS
-- ===========================
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
    (gen_random_uuid(),
     (SELECT property_id FROM properties WHERE name = 'Lake View Resort'),
     (SELECT user_id FROM users WHERE email = 'john@example.com'),
     5, 'Wonderful stay! Great hospitality and clean rooms.');

-- ===========================
-- MESSAGES
-- ===========================
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
    (gen_random_uuid(),
     (SELECT user_id FROM users WHERE email = 'john@example.com'),
     (SELECT user_id FROM users WHERE email = 'jane@example.com'),
     'Hi Jane, I really enjoyed staying at your resort!'),
    
    (gen_random_uuid(),
     (SELECT user_id FROM users WHERE email = 'jane@example.com'),
     (SELECT user_id FROM users WHERE email = 'john@example.com'),
     'Thank you, John! Glad you had a great time. Hope to host you again!');
