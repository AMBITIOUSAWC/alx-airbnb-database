-- 1. INNER JOIN to get bookings and their users
SELECT b.*, u.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- 2. LEFT JOIN to get all properties and their reviews
SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- 3. FULL OUTER JOIN to get all users and all bookings (even unmatched ones)
SELECT u.*, b.*
FROM users