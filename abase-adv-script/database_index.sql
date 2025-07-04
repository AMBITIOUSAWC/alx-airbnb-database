-- Create indexes to optimize queries

-- Index on user email for fast lookup
CREATE INDEX idx_users_email ON users(email);

-- Index on bookings.user_id for filtering and joins
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id for joins
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on properties.city for filtering
CREATE INDEX idx_properties_city ON properties(city);

