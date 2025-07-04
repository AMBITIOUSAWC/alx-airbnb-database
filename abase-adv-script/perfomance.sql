-- Initial complex query with joins
SELECT b.id AS booking_id, u.first_name, u.last_name, p.name AS property_name, pay.amount
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON pay.booking_id = b.id;

-- Optimized version (e.g., if indexes exist on user_id, property_id, booking_id)
-- Only select needed columns, and assume indexes are present
SELECT b.id, u.first_name, u.last_name, p.name, pay.amount
FROM bookings b
JOIN users u USING(id)
JOIN properties p ON b.property_id = p.id
JOIN payments pay USING(booking_id);

