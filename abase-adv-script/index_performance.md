# Index Performance Report

## Before Indexing
Queries involving user lookups by email or filtering bookings by user_id were slow and full table scans occurred.

## After Indexing
- Indexing `users.email` allowed instant lookups by email.
- Indexing `bookings.user_id` and `property_id` significantly reduced join costs.
- Indexing `properties.city` improved filtering performance.

## Tools Used
- EXPLAIN
- ANALYZE

