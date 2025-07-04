

-- INNER JOIN: Get all bookings and the users who made them
SELECT b.*, u.*
FROM bookings b
INNER JOIN users u ON b.user_id = u.id;

-- LEFT JOIN: Get all properties and their reviews (even if no reviews)
SELECT p.*, r.*
FROM properties p
LEFT JOIN reviews r ON p.id = r.property_id;

-- FULL OUTER JOIN: Get all users and bookings (even unmatched)
SELECT u.*, b.*
FROM users u
FULL OUTER JOIN bookings b ON u.id = b.user_id;
