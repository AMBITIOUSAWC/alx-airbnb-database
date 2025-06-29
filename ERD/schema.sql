# Initial Database Schema (Unnormalized)

This section presents the initial SQL schema for the Airbnb-like database. This design intentionally contains redundancies and violations of normalization principles, which will be addressed in the subsequent normalization steps documented in this file.

*This schema serves as the starting point for the normalization exercise.*

```sql
-- This is our initial, somewhat messy database schema.
-- We will normalize this in later steps!

-- # Table: users
-- Represents users of the platform (hosts or guests).
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_phone VARCHAR(20), -- Potential for multiple phones in one field (1NF violation)
    user_city VARCHAR(50),
    user_state VARCHAR(50),
    user_country VARCHAR(50)
);

-- # Table: properties
-- Represents the listings available on the platform.
CREATE TABLE properties (
    property_id INT PRIMARY KEY AUTO_INCREMENT,
    property_name VARCHAR(255) NOT NULL,
    property_description TEXT,
    host_id INT, -- Foreign key to the user who owns the property
    property_address VARCHAR(255),
    property_city VARCHAR(50), -- Redundancy with user_city, and transitive dependency (3NF violation)
    property_state VARCHAR(50),
    property_country VARCHAR(50),
    number_of_rooms INT,
    price_per_night DECIMAL(10, 2),
    amenities VARCHAR(255) -- Stores multiple amenities as a comma-separated string (1NF violation)
);

-- # Table: bookings
-- Records details of property bookings.
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT, -- Foreign key to the booked property
    user_id INT,     -- Foreign key to the user making the booking
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price DECIMAL(10, 2),
    guest_count INT,
    -- Redundant host information (violates 3NF, data already in 'users' table)
    host_name VARCHAR(100),
    host_email VARCHAR(100),
    -- Redundant property details (violates 3NF, data already in 'properties' table)
    booked_property_name VARCHAR(255),
    booked_property_city VARCHAR(50),
    booked_property_price_per_night DECIMAL(10, 2)
);

-- # Foreign Key Relationships
-- Establishing initial links between tables.

ALTER TABLE properties
ADD CONSTRAINT fk_host
FOREIGN KEY (host_id) REFERENCES users(user_id);

ALTER TABLE bookings
ADD CONSTRAINT fk_booked_property
FOREIGN KEY (property_id) REFERENCES properties(property_id);

ALTER TABLE bookings
ADD CONSTRAINT fk_booking_user
FOREIGN KEY (user_id) REFERENCES users(user_id);
