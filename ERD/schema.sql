-- Table for Users
CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(100) UNIQUE NOT NULL,
    user_phone VARCHAR(20), -- Let's imagine we might put multiple phones here later if not careful
    user_city VARCHAR(50),
    user_state VARCHAR(50),
    user_country VARCHAR(50)
);

-- Table for Properties (Listings)
CREATE TABLE properties (
    property_id INT PRIMARY KEY AUTO_INCREMENT,
    property_name VARCHAR(255) NOT NULL,
    property_description TEXT,
    host_id INT, -- This connects to the user who owns the property
    property_address VARCHAR(255),
    property_city VARCHAR(50), -- Redundancy here with user_city? Maybe.
    property_state VARCHAR(50),
    property_country VARCHAR(50),
    number_of_rooms INT,
    price_per_night DECIMAL(10, 2),
    amenities VARCHAR(255) -- Let's imagine we list multiple amenities here (e.g., "WiFi, Pool, Gym")
);

-- Table for Bookings
CREATE TABLE bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    property_id INT, -- What property is being booked
    user_id INT,     -- Who is booking
    check_in_date DATE NOT NULL,
    check_out_date DATE NOT NULL,
    total_price DECIMAL(10, 2),
    guest_count INT,
    -- Let's intentionally add some host info here for redundancy
    host_name VARCHAR(100),
    host_email VARCHAR(100),
    -- And some property details
    booked_property_name VARCHAR(255),
    booked_property_city VARCHAR(50),
    booked_property_price_per_night DECIMAL(10, 2)
);

-- Adding some foreign key relationships (basic connections)
ALTER TABLE properties
ADD CONSTRAINT fk_host
FOREIGN KEY (host_id) REFERENCES users(user_id);

ALTER TABLE bookings
ADD CONSTRAINT fk_booked_property
FOREIGN KEY (property_id) REFERENCES properties(property_id);

ALTER TABLE bookings
ADD CONSTRAINT fk_booking_user
FOREIGN KEY (user_id) REFERENCES users(user_id);
