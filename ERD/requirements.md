# Database Normalization Analysis - AirBnB Schema

## Overview
This document provides a comprehensive analysis of the AirBnB database schema normalization, ensuring compliance with Third Normal Form (3NF) principles. The analysis reviews each entity for potential redundancies and normalization violations, with recommendations for optimization.

## Database Schema Review

### Current Schema Structure
The AirBnB database consists of six main entities:
- **User**: Stores user information (guests, hosts, admins)
- **Property**: Stores rental property details
- **Booking**: Manages reservation transactions
- **Payment**: Handles financial transactions
- **Review**: Manages user feedback and ratings
- **Message**: Facilitates user communication

sql
Property {
    location: VARCHAR -- Contains city, state, country as single field
}

**Recommended Enhancement**:
sql
New Location entity
Location {
    location_id: UUID (PK)
    city: VARCHAR NOT NULL
    state: VARCHAR NOT NULL
    country: VARCHAR NOT NULL
    postal_code: VARCHAR
    created_at: TIMESTAMP
}

Updated Property entity
Property {
    property_id: UUID (PK)
    host_id: UUID (FK)
    location_id: UUID (FK) -- References Location.location_id
    name: VARCHAR NOT NULL
    description: TEXT NOT NULL
    price_per_night: DECIMAL NOT NULL
    created_at: TIMESTAMP
    updated_at: TIMESTAMP
}

**Benefits**:
- Eliminates redundancy when multiple properties exist in the same location
- Enables better location-based queries and analytics
- Supports standardized location formatting
- Allows for future geographic features (coordinates, timezone, etc.)

### 2. Payment Method Normalization

**Current State**:
sql
Payment {
    payment_method: ENUM('credit_card', 'paypal', 'stripe')
}

**Recommended Enhancement** (Optional):
sql
New PaymentMethod entity
PaymentMethod {
    method_id: UUID (PK)
    method_name: VARCHAR UNIQUE NOT NULL
    description: TEXT
    is_active: BOOLEAN DEFAULT TRUE
    created_at: TIMESTAMP
}

Updated Payment entity
Payment {
    payment_id: UUID (PK)
    booking_id: UUID (FK)
    method_id: UUID (FK) -- References PaymentMethod.method_id
    amount: DECIMAL NOT NULL
    payment_date: TIMESTAMP
}

Updated User entity
User {
    user_id: UUID (PK)
    role_id: UUID (FK) -- References Role.role_id
    first_name: VARCHAR NOT NULL
    last_name: VARCHAR NOT NULL
    email: VARCHAR UNIQUE NOT NULL
    password_hash: VARCHAR NOT NULL
    phone_number: VARCHAR
    created_at: TIMESTAMP
    role: ENUM (guest, host, admin), NOT NULL
}
